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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        final containerWidth = constraints.maxWidth;
        final containerHeight = constraints.maxHeight;

        return Material(
          elevation: 2.0,
          color: color,
          borderRadius: BorderRadius.circular(15.0),
          child: InkWell(
            onTap: onPressed,
            splashColor: Colors.white.withAlpha(25),
            borderRadius: BorderRadius.circular(15.0),
            child: Container(

              height: containerHeight * 0.055,
              width: containerWidth * 0.4,

              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: containerWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}