import 'package:flutter/material.dart';

class Confirm extends StatelessWidget {
  final Color color;
  final String text;
  final Function() onPressed;

  const Confirm({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed
  });

  //test

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: color,
      borderRadius: BorderRadius.circular(15.0),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white.withValues(alpha: 0.1),
        //highlightColor: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          height: 50,
          width: 200,
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white
                ),
              )
          ),
        ),
      ),
    );
  }
}