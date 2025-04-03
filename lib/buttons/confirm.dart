import 'package:flutter/material.dart';

class Confirm extends StatelessWidget {
  final Color color;
  final String text;
  final double height;
  final double width;
  final Function() onPressed;

  const Confirm({
    super.key,
    required this.color,
    required this.text,
    required this.height,
    required this.width,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //RECOMMENDED HEIGHT-WIDTH: 55-400

    return Material(
      elevation: 2.0,
      color: color,
      borderRadius: BorderRadius.circular(15.0),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15.0),
        child: SizedBox(
          height: screenHeight * 0.001 * height,
          width: screenWidth * 0.001 * width,
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04
                ),
              )
          ),
        ),
      ),
    );
  }
}