import 'package:flutter/material.dart';

class ScoreButton extends StatelessWidget {
  final String displayScore;
  final VoidCallback onPressed;
  final VoidCallback onPressed2;

  const ScoreButton({
    Key? key,
    required this.displayScore,
    required this.onPressed,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(onPressed: onPressed, child: Text('-')),
        Text(displayScore),
        ElevatedButton(onPressed: onPressed2, child: Text('+')),
      ],
    );
  }
}

