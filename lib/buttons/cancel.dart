import 'package:flutter/material.dart';

class Cancel extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function() onTap;

  const Cancel({
    super.key,
    required this.color,
    required this.icon,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: 1.0,
      color: color,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(15.0),
        child: SizedBox(
          height: screenWidth * 0.08,
          width: screenWidth * 0.08,
          child: Center(
              child: Icon(
                  icon,
                color: Colors.white,
                size: screenWidth * 0.06,
              )
          ),
        ),
      ),
    );
  }
}