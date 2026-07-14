import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIService extends ChangeNotifier {
  Future<String> getResponse(String message) async {
    const apiKey = "YOUR_API_KEY_HERE"; // استبدل بمفتاح OpenAI

    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [{"role": "user", "content": "You are a professional English tutor. Respond in English and correct my mistakes: $message"}],
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
