import 'package:flutter/material.dart';

class ScoreButton extends StatelessWidget {
  final String title;
  final String displayScore;
  final int color1;
  final int color2;
  final VoidCallback onPressed;
  final VoidCallback onPressed2;



  const ScoreButton({
    Key? key,
    required this.title,
    required this.displayScore,
    required this.color1,
    required this.color2,
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
            color: Color(color2),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [

            ],
          ),
          child: Text(title,
            textAlign: TextAlign.center,
              style: TextStyle(

                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(color1),
              ),
          ),
        ),
        Container(
          width: 205,
          height: 75,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color(color2),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [

            ],
          ),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(color1),
                  foregroundColor: Color(color2),

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
                  color: Color(color1),
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: const [

                  ],
                ),
                child: Text(displayScore,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(color2),

                  ),
                ),
              ),
              ElevatedButton(
                onPressed: onPressed2,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(color1),
                  // Background color
                  foregroundColor: Color(color2),
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
