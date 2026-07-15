import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIService extends ChangeNotifier {
  Future<String> getResponse(String userMessage) async {
    const apiKey = "YOUR_API_KEY_HERE"; // غير هذا بمفتاحك

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [
            {"role": "user", "content": "أنت مدرب إنجليزي محترف. رد بالإنجليزية وصحح أخطائي: $userMessage"}
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      }
      return "Sorry, I couldn't respond. Try again.";
    } catch (e) {
      return "Error connecting to AI. Check your internet.";
    }
  }
}
