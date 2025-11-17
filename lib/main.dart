import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}



Future<void> sendWebhook(String content) async {
  final String webhookUrl =
      'https://discordapp.com/api/webhooks/1440119165116747806/kcTs3ji_UpM-IqfDV3I9tx5H9DJBTJrUyIyxpe5PYUjrpZ_Z1CaOnCyvkSR-ESISks_A';
  
  Map<String, dynamic> discordMessage = {
    'content': content,
    'username': 'Flutter App',
  };

  try {
    final response = await http.post(
      Uri.parse(webhookUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(discordMessage),
    );

    if (response.statusCode == 204) {
      print('Discord webhook sent successfully!');
    } else {
      print(
        'Failed to send Discord webhook: ${response.statusCode} - ${response.body}',
      );
    }
  } catch (e) {
    print('Error sending Discord webhook: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                sendWebhook('**{}{}{}{}{}{}{}{}{}{}**\n'
                    '');

              },

              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
