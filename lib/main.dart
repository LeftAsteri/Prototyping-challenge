import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ScoreButton.dart';

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
  int ovenScore = 0;
  int ovenMiss = 0;
  int trayScore = 0;
  int trayMiss = 0;
  int hatchScore = 0;
  int hatchMiss = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scounting App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreButton(
                  displayScore: '$ovenScore',
                  onPressed: () {
                    setState(() {
                      ovenScore--;
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      ovenScore++;
                    });
                  },
                ),
                ScoreButton(
                  displayScore: '$ovenMiss',
                  onPressed: () {
                    setState(() {
                      ovenMiss--;
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      ovenMiss++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(onPressed: () {
                Navigator.pop(context, 'OK');
                sendWebhook(
                  '**\\--\\--\\--\\--\\--\\--\\--\\--\\--\\--\\--**\nOven Score: $ovenScore\nOven Miss: $ovenMiss\nTray Score: $trayScore\nTray Miss: $trayMiss\nHatch Score: $hatchScore\nHatch Miss: $hatchMiss\n**\\--\\--\\--\\--\\--\\--\\--\\--\\--\\--\\--**',
                );
                setState(() {
                  ovenScore = 0;
                  ovenMiss = 0;
                  trayScore = 0;
                  trayMiss = 0;
                  hatchScore = 0;
                  hatchMiss = 0;
                });
              }, child: const Text('OK')),
            ],
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
