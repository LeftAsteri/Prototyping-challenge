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
        Container(
          width: 110,
          height: 30,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [

            ],
          ),
          child: Text(title,
            textAlign: TextAlign.center,
              style: TextStyle(

                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
          ),
        ),
        Container(
          width: 205,
          height: 75,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [

            ],
          ),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.yellow,

                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('-'),
              ),
              Container(
                width: 50,
                height: 25,
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: const [

                  ],
                ),
                child: Text(displayScore,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,

                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onPressed2,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  // Background color
                  foregroundColor: Colors.yellow,
                  // Text/icon color


                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('+'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
