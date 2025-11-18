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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
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

  //------------------------
  final double xDistance = 8;
  final double yDistance = 16;
  final int color2 = 0xFFB3001B;
  final int color1 = 0xFF020202;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(color1),
      appBar: AppBar(title: const Text('Scouting App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreButton(
                  title: 'Oven Score',
                  displayScore: '$ovenScore',
                  color1: color1,
                  color2: color2,
                  onPressed: () {
                    setState(() {
                      if (ovenScore > 0) {
                        ovenScore--;
                      }
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      ovenScore++;
                    });
                  },
                ),
                SizedBox(width: xDistance),
                ScoreButton(
                  title: 'Oven Miss',
                  displayScore: '$ovenMiss',
                  color1: color1,
                  color2: color2,
                  onPressed: () {
                    setState(() {
                      if (ovenMiss > 0) {
                        ovenMiss--;
                      }
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
            SizedBox(height: yDistance),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreButton(
                  title: 'Tray Score',
                  displayScore: '$trayScore',
                  color1: color1,
                  color2: color2,
                  onPressed: () {
                    setState(() {
                      if (trayScore > 0) {
                        trayScore--;
                      }
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      trayScore++;
                    });
                  },
                ),
                SizedBox(width: xDistance),
                ScoreButton(
                  title: 'Tray Miss',
                  color1: color1,
                  color2: color2,
                  displayScore: '$trayMiss',
                  onPressed: () {
                    setState(() {
                      if (trayMiss > 0) {
                        trayMiss--;
                      }
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      trayMiss++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: yDistance),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScoreButton(
                  title: 'Hatch Score',
                  displayScore: '$hatchScore',
                  color1: color1,
                  color2: color2,
                  onPressed: () {
                    setState(() {
                      if (hatchScore > 0) {
                        hatchScore--;
                      }
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      hatchScore++;
                    });
                  },
                ),
                SizedBox(width: xDistance),
                ScoreButton(
                  title: 'Hatch Miss',
                  displayScore: '$hatchMiss',
                  color1: color1,
                  color2: color2,
                  onPressed: () {
                    setState(() {
                      if (hatchMiss > 0) {
                        hatchMiss--;
                      }
                    });
                  },
                  onPressed2: () {
                    setState(() {
                      hatchMiss++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: yDistance),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text(
              'This will clear the current values and send the data to the WebHook',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
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
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Text('Done?'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}
