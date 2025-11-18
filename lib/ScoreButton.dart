import 'package:flutter/material.dart';

class ScoreButton extends StatelessWidget {
  final String title;
  final String displayScore;
  final VoidCallback onPressed;
  final VoidCallback onPressed2;

  const ScoreButton({
    Key? key,
    required this.title,
    required this.displayScore,
    required this.onPressed,
    required this.onPressed2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Container(
          width: 175,
          height: 75,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              ElevatedButton(onPressed: onPressed, child: Text('-')),
              Container(
                width: 25,
                height: 25,
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Text(displayScore),
              ),
              ElevatedButton(onPressed: onPressed2, child: Text('+')),
            ],
          ),
        ),
      ],
    );
  }
}
