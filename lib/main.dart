import 'package:flutter/material.dart';

void main() => runApp(const LinguaForgeApp());

class LinguaForgeApp extends StatelessWidget {
  const LinguaForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinguaForge AI',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('LinguaForge AI')),
        body: const Center(
          child: Text(
            '🎉 مرحباً!\n\nالتطبيق يعمل الآن\n\nسنضيف الذكاء الاصطناعي قريباً',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
