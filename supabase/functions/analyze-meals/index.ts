// 플러터 앱에서: POST /functions/v1/analyze-meals
// Request Body: { mealDayId, userId }
// Prompt Input: { raw_text, category, locale }

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

// 프롬프트 템플릿
const MEAL_ANALYSIS_PROMPT = `너는 하루 식단 기록을 분석해 영양 및 기저질환 관련 피드백을 생성하는 엔진이다.

역할:
- 사용자가 입력한 하루치 식단 텍스트 목록을 읽고,
- 기저질환(예: 당뇨)을 고려한 일반적인 식이/영양 피드백을 생성한다.

안전 규칙 (반드시 지켜야 함):
- 의료 진단, 치료, 약물, 수치 단정은 절대 하지 말 것
- “~할 수 있어요”, “~일 가능성이 있어요” 같은 추정 표현만 사용
- 전문적인 판단이 필요한 경우 “전문가와 상담해보세요” 정도로만 언급
- 사용자를 비난하거나 단정적으로 말하지 말 것

출력 규칙:
- 출력은 반드시 **JSON만** 반환한다 (설명 문장, 마크다운 금지)
- 모든 사용자 노출 문구는 한국어(ko-KR)로 작성
- 간결하고 실용적인 톤 유지

분석 기준:
- 정확한 영양 수치는 알 수 없으므로 정성적 평가 위주로 판단
- 식단 구성(탄수화물/단백질/채소/가공식품/당 음료 등)을 중심으로 평가
- 불확실한 경우 명확히 불확실하다고 표시

overall_summary 예시 문장 구조:
- "하루 식단을 보면 … 비중이 높고, … 균형은 다소 부족해 보일 수 있어요.",
- "하루 동안 세 끼를 모두 섭취했으며, 단백질 식품과 채소가 비교적 고르게 포함된 식단으로 보입니다. 다만 밥과 볶음밥 등 탄수화물 비중이 있어 혈당 변동 가능성은 고려해볼 수 있습니다.",

출력 JSON 스키마:

{
  "overall_summary": string,
  "condition_feedback": [
    {
      "condition": string,
      "summary": string,
      "points": [string],
      "suggestions": [
        {
          "title": string,
          "detail": string
        }
      ],
      "confidence": number
    }
  ],
  "nutrition_feedback": {
    "summary": string,
    "good_points": [string],
    "improve_points": [string],
    "next_actions": [
      {
        "title": string,
        "detail": string
      }
    ],
    "confidence": number
  },
  "uncertainties": [string],
  "disclaimer": string
}

입력값:

conditions:
{conditions}

meal_logs:
{meal_logs}`;

// 카테고리 한글 매핑
const CATEGORY_MAP: Record<string, string> = {
  'breakfast': '아침',
  'lunch': '점심',
  'dinner': '저녁',
  'snack': '간식',
};

serve(async (req) => {
  try {
    // 인증 확인
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: 'Authorization header is required' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_ANON_KEY')!,
      { global: { headers: { Authorization: authHeader } } }
    );

    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized' }),
        { status: 401, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 요청 파라미터 파싱
    const { mealDayId } = await req.json();
    if (!mealDayId) {
      return new Response(
        JSON.stringify({ error: 'mealDayId is required' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // Supabase Web Dashboard 에서 확인 가능
    console.log(`[AI 분석 시작] User: ${user.id}, MealDay: ${mealDayId}`); // 로깅

    // MealDay 및 MealEntries 조회
    const { data: mealDayData, error: mealDayError } = await supabase
      .from('meal_days')
      .select(`
        id,
        meal_date,
        meal_entries (
          id,
          category,
          content,
          eaten_at
        )
      `)
      .eq('id', mealDayId)
      .eq('user_id', user.id)
      .is('deleted_at', null)
      .is('meal_entries.deleted_at', null)
      .single();

    if (mealDayError || !mealDayData) {
      return new Response(
        JSON.stringify({ error: 'MealDay not found or access denied' }),
        { status: 404, headers: { 'Content-Type': 'application/json' } }
      );
    }

    // 사용자 기저질환 조회
    const { data: userDiseases, error: diseasesError } = await supabase
      .from('user_diseases')
      .select('diseases(name)')
      .eq('user_id', user.id);
    if (diseasesError) {
      console.error('user_diseases 조인 실패', diseasesError);
    }
    const conditions: string[] = userDiseases?.map((item: any) => item.diseases.name) || [];
    console.log(`[기저질환] ${conditions.length > 0 ? conditions.join(', ') : '없음'}`); // 로깅

    // meal_logs 포맷팅
    const mealLogs = (mealDayData.meal_entries || [])
      .filter((entry: any) => entry.content) // content가 있는 것만
      .map((entry: any) => ({
        raw_text: entry.content,
        category: CATEGORY_MAP[entry.category] || entry.category,
        locale: 'ko-KR',
      }));

    if (mealLogs.length === 0) {
      return new Response(
        JSON.stringify({ error: 'No meal entries found for analysis' }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }
    console.log(`[Meal] ${mealLogs.length} entries`); // 로깅

    // 프롬프트 생성
    const prompt = MEAL_ANALYSIS_PROMPT
      .replace('{conditions}', JSON.stringify(conditions, null, 2))
      .replace('{meal_logs}', JSON.stringify(mealLogs, null, 2));

    // OpenAI API 호출
    const openaiApiKey = Deno.env.get('OPENAI_API_KEY');
    if (!openaiApiKey) {
      return new Response(
        JSON.stringify({ error: 'OpenAI API key not configured' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const openaiResponse = await fetch('https://api.openai.com/v1/chat/completions', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${openaiApiKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        model: 'gpt-4o',
        messages: [
          {
            role: 'user',
            content: prompt,
          },
        ],
        response_format: { type: "json_object" }, // JSON 모드 활성화
        temperature: 0.7,
      }),
    });

    if (!openaiResponse.ok) {
      const errorText = await openaiResponse.text();
      console.error('OpenAI API Error:', errorText);
      return new Response(
        JSON.stringify({ error: 'Failed to call OpenAI API' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const aiResult = await openaiResponse.json();
    const analysisContent = aiResult.choices[0].message.content;

    // JSON 파싱
    let analysisJson;
    try {
      analysisJson = JSON.parse(analysisContent);
    } catch (parseError) {
      console.error('Failed to parse AI response as JSON:', analysisContent);
      return new Response(
        JSON.stringify({ error: 'AI response is not valid JSON' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }

    console.log('[LLM 분석 완료] RPC호출해서 DB에 결과 저장 중'); // 로깅

    // RPC 호출하여 분석 결과 저장
    const { error: rpcError } = await supabase.rpc('save_meal_day_analysis', {
      p_meal_day_id: mealDayId,
      p_result: analysisJson,
      p_overall_summary: analysisJson.overall_summary,
      p_condition_feedback: analysisJson.condition_feedback || null,
      p_suggestions: analysisJson.nutrition_feedback?.next_actions || null,
      p_locale: 'ko-KR',
    });
    if (rpcError) {
      console.error('RPC Error:', rpcError);
      return new Response(
        JSON.stringify({ error: 'Failed to save analysis result' }),
        { status: 500, headers: { 'Content-Type': 'application/json' } }
      );
    }
    console.log('[성공] 분석 결과 DB 저장 완료'); // 로깅

    // 성공 응답
    return new Response(
      JSON.stringify({
        success: true,
        analysis: analysisJson,
      }),
      {
        status: 200,
        headers: { 'Content-Type': 'application/json' },
      }
    );

  } catch (error) {
    console.error('Unexpected error:', error);
    return new Response(
      JSON.stringify({ error: error.message || 'Internal server error' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
});