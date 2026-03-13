const { onRequest } = require("firebase-functions/v2/https");
const { logger } = require("firebase-functions");
const axios = require("axios");
const { defineSecret } = require("firebase-functions/params");

const TELEGRAM_BOT_TOKEN = defineSecret("TELEGRAM_BOT_TOKEN");
const TELEGRAM_CHANNEL_ID = defineSecret("TELEGRAM_CHANNEL_ID");

// V2 HTTP Request trigger with built-in CORS
exports.sendapierrortotelegramv3 = onRequest({
  secrets: [TELEGRAM_BOT_TOKEN, TELEGRAM_CHANNEL_ID],
  cors: true, // Allow all origins for now to verify connectivity, then we can restrict
}, async (req, res) => {
  logger.info("📩 Received notification request", { 
    method: req.method, 
    headers: req.headers,
    body: req.body 
  });

  if (req.method !== "POST") {
    return res.status(405).send("Method Not Allowed");
  }

  const data = req.body;
  const botToken = TELEGRAM_BOT_TOKEN.value();
  const chatId = TELEGRAM_CHANNEL_ID.value();

  if (!botToken || !chatId) {
    logger.error("❌ Telegram secrets are missing");
    return res.status(500).send({ success: false, error: "Configuration error" });
  }

  const type = data.error_type || "Unknown";
  const method = data.method || "N/A";
  const uri = data.uri || "N/A";
  const message = data.message || "";
  const responseData = data.response_data || "";

  let telegramMessage = `🚨 *[Carai API Error (V3)]*\n`;
  telegramMessage += `📌 *Type:* ${type}\n`;
  telegramMessage += `🔗 *Request:* ${method} ${uri}\n`;
  if (message) telegramMessage += `📝 *Message:* ${message}\n`;
  if (responseData) {
    telegramMessage += `📦 *Response:*\n\`\`\`json\n${responseData}\n\`\`\``;
  }

  try {
    await axios.post(`https://api.telegram.org/bot${botToken}/sendMessage`, {
      chat_id: chatId,
      text: telegramMessage,
      parse_mode: "Markdown",
    });
    logger.info("✅ Message sent to Telegram");
    return res.status(200).send({ success: true });
  } catch (error) {
    logger.error("❌ Failed to send message to Telegram", { error: error.message });
    return res.status(500).send({ success: false, error: error.message });
  }
});
