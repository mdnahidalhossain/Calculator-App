import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final buttonColor;
  final textColor;
  final String buttonText;
  final buttonTapped;

  MyButton({
    super.key,
    this.buttonColor,
    this.textColor,
    required this.buttonText,
    this.buttonTapped
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
