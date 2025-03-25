import 'package:flutter/material.dart';

class Confirm extends StatelessWidget {
  final Color color;
  final String text;

  const Confirm({
    super.key,
    required this.color,
    required this.text
  });

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