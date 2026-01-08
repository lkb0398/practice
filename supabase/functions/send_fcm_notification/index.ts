// 🤍 변경 후 적용 명령어 : supabase functions deploy send_fcm_notification --no-verify-jwt 

import { serve } from "https://deno.land/std@0.224.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { SignJWT, importPKCS8 } from "https://esm.sh/jose@5.2.4";

/* --------------------------------------------------
 * Supabase Client (Service Role)
 * -------------------------------------------------- */
const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
);

/* --------------------------------------------------
 * FCM OAuth Access Token
 * -------------------------------------------------- */
async function getAccessToken(): Promise<string> {
  const clientEmail = Deno.env.get("FCM_CLIENT_EMAIL")!;
  const privateKeyRaw = Deno.env.get("FCM_PRIVATE_KEY")!;
  const privateKey = privateKeyRaw.replace(/\\n/g, "\n");

  const now = Math.floor(Date.now() / 1000);

  // 🔑 PKCS8 키 파싱 (여기서 jose가 다 처리)
  const key = await importPKCS8(privateKey, "RS256");
  console.log("🔐 private key header:", privateKey.split("\n")[0]);
  console.log("🔐 private key footer:", privateKey.split("\n").at(-2));


  const jwt = await new SignJWT({
    scope: "https://www.googleapis.com/auth/firebase.messaging",
  })
    .setProtectedHeader({ alg: "RS256" })
    .setIssuer(clientEmail)
    .setAudience("https://oauth2.googleapis.com/token")
    .setIssuedAt(now)
    .setExpirationTime(now + 3600)
    .sign(key);

  const res = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({
      grant_type: "urn:ietf:params:oauth:grant-type:jwt-bearer",
      assertion: jwt,
    }),
  });

  const data = await res.json();

  if (!data.access_token) {
    console.error("OAuth token error:", data);
    throw new Error("Failed to get access token");
  }

  return data.access_token;
}

/* --------------------------------------------------
 * Next Fire Time (DST-safe)
 * -------------------------------------------------- */
function calculateNextDailyFireAt(timezone: string, time: string): string {
  const [hour, minute] = time.split(":").map(Number);

  const nowLocal = new Date(
    new Date().toLocaleString("en-US", { timeZone: timezone }),
  );

  const next = new Date(nowLocal);
  next.setHours(hour, minute, 0, 0);

  if (next <= nowLocal) {
    next.setDate(next.getDate() + 1);
  }

  return next.toISOString(); // UTC
}

/* --------------------------------------------------
 * Main Handler (Cron Entry)
 * -------------------------------------------------- */
serve(async () => {
  try {
    console.log("🚀 function start");

    console.log("ENV CHECK", {
      hasProjectId: !!Deno.env.get("FCM_PROJECT_ID"),
      hasClientEmail: !!Deno.env.get("FCM_CLIENT_EMAIL"),
      hasPrivateKey: !!Deno.env.get("FCM_PRIVATE_KEY"),
      hasSupabaseUrl: !!Deno.env.get("SUPABASE_URL"),
      hasServiceKey: !!Deno.env.get("SUPABASE_SERVICE_ROLE_KEY"),
    });

    const now = new Date().toISOString();

    // 1️⃣ 발송 대상 조회
    const { data: notis, error } = await supabase
      .from("notifications")
      .select("*")
      .eq("is_enabled", true)
      .lte("next_fire_at", now)

    if (error) {
      console.error("❌ notifications query error", error);
      throw error;
    }

    console.log("notis length:", notis?.length ?? 0);

    if (!notis || notis.length === 0) {
      return new Response("No notifications", { status: 200 });
    }

    console.log("🔐 getting access token...");
    const accessToken = await getAccessToken();
    console.log("access token ok");
    const projectId = Deno.env.get("FCM_PROJECT_ID")!;

    // 2️⃣ 알림 처리
    for (const noti of notis) {
      // 🔒 중복 발송 방지: 먼저 next_fire_at 갱신
      const nextFireAt = calculateNextDailyFireAt(
        noti.timezone,
        noti.time,
      );

      await supabase
        .from("notifications")
        .update({ next_fire_at: nextFireAt })
        .eq("noti_id", noti.noti_id);

      // 사용자 FCM 토큰 조회
      const { data: tokens } = await supabase
        .from("fcm_tokens")
        .select("fcm_token")
        .eq("user_id", noti.user_id);

      if (!tokens || tokens.length === 0) continue;
      
      // FCM 발송
      for (const t of tokens) {
        const res = await fetch(
          `https://fcm.googleapis.com/v1/projects/${projectId}/messages:send`,
          {
            method: "POST",
            headers: {
              Authorization: `Bearer ${accessToken}`,
              "Content-Type": "application/json",
            },
            body: JSON.stringify({
              message: {
                token: t.fcm_token,
                  // 🤍 시스템 알림 커스텀
                  notification: {
                    title: `vitameal`,
                    body: `${noti.time.slice(0,5)} ${noti.label} 알람입니다`,
                  },
                
                  // 앱 로직용 데이터 > 로컬 알림 표시에서 커스텀 예정
                  data: {
                    type: "alarm",
                    alarm_id: noti.noti_id,
                    label: noti.label,
                    time: noti.time,
                  },
                
                  android: {
                    priority: "high",
                    notification: {
                      channel_id: "vitameal_alarm",
                      sound: "default",
                    },
                  },
                
                  apns: {
                    payload: {
                      aps: {
                        sound: "default",
                      },
                    },
                  },
              },
            }),
          },
        );

        if (!res.ok) {
          console.error(
            "FCM send failed:",
            t.fcm_token,
            await res.text(),
          );
        }
      }
    }

    return new Response("OK", { status: 200 });
  } catch (e) {
    console.error("🔥 FUNCTION ERROR", e);
    return new Response( JSON.stringify({ error: String(e) }), { status: 500 });
  }
});
