import 'package:flutter/material.dart';

class Cancel extends StatelessWidget {
  final Color color;
  final String text;

  const Cancel({
    super.key,
    required this.color,
    required this.text
  });

  //test

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}