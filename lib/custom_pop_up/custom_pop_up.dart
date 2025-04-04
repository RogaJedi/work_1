import 'package:flutter/material.dart';
import 'package:work_1/buttons/cancel.dart';
import 'package:work_1/buttons/confirm.dart';

class CustomPopUp extends StatelessWidget {
  final String picture;
  final String mainText;
  final String subText;
  final Function() onClose;
  final Confirm confirmButton;

  CustomPopUp({
    super.key,
    required this.picture,
    required this.mainText,
    required this.subText,
    required this.onClose,
    required this.confirmButton
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        width: screenWidth,
        height: screenHeight * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.01,
                    bottom: screenHeight * 0.01,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.175,
                      width: screenWidth * 0.9,
                      child: ClipRRect(
                        child: Image.network(
                          picture,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.09,
                      width: screenWidth * 0.9,
                      child: Center(
                        child: Text(
                          mainText,
                          style: TextStyle(
                            fontSize: screenWidth * 0.065,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.14,
                      width: screenWidth * 0.9,
                      child: Center(
                        child: Text(
                          subText,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.9,
                      child: Center(child: confirmButton),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Cancel(
                  color: Colors.grey,
                  icon: Icons.close_rounded,
                  onTap: onClose
              ),
            ),
          ],
        ),
      ),
    );
  }
}