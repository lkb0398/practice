import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vitameal/domain/entity/meal_analysis_entity.dart';

class AiAnalysisDetailDialog extends HookWidget {
  /// AI 분석 자세히 보기 대화상자
  const AiAnalysisDetailDialog({super.key, required this.analysis});

  final MealAnalysisEntity analysis;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    // 페이지 변경 감지
    useEffect(() {
      void listener() {
        currentPage.value = pageController.page?.round() ?? 0;
      }

      pageController.addListener(listener);
      return () => pageController.removeListener(listener);
    }, [pageController]);

    final conditionFeedbacks = analysis.conditionFeedback;
    final pageCount = conditionFeedbacks.length;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 600),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 헤더
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '기저질환별 피드백',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 페이지 뷰 (슬라이드)
            Expanded(
              child: pageCount > 0
                  ? PageView.builder(
                      controller: pageController,
                      itemCount: pageCount,
                      itemBuilder: (context, index) {
                        final feedback = conditionFeedbacks[index];
                        return _ConditionFeedbackPage(feedback: feedback);
                      },
                    )
                  : const Center(
                      child: Text(
                        '기저질환 피드백이 없습니다',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ),

            // 페이지 인디케이터
            if (pageCount > 1) ...[
              const SizedBox(height: 16),
              _PageIndicator(
                pageCount: pageCount,
                currentPage: currentPage.value,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 기저질환별 피드백 페이지
class _ConditionFeedbackPage extends StatelessWidget {
  const _ConditionFeedbackPage({required this.feedback});

  final ConditionFeedback feedback;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 질환명
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF7ED321).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              feedback.condition,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7ED321),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 요약
          Text(
            feedback.summary,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          // 주요 포인트
          if (feedback.points.isNotEmpty) ...[
            const Text(
              '주요 포인트',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            ...feedback.points.map((point) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontSize: 14, color: Colors.black54)),
                      Expanded(
                        child: Text(
                          point,
                          style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
          ],

          // 개선 제안
          if (feedback.suggestions.isNotEmpty) ...[
            const Text(
              '개선 제안',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            ...feedback.suggestions.map((suggestion) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        suggestion.title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        suggestion.detail,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.4,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )),
          ],

          // 신뢰도
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                '신뢰도: ${(feedback.confidence * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 페이지 인디케이터
class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.pageCount,
    required this.currentPage,
  });

  final int pageCount;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentPage ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentPage ? const Color(0xFF7ED321) : Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
