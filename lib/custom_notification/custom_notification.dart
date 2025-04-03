import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CN_SM/CN_Cubit.dart';
import 'CN_SM/CN_State.dart';

enum NotificationType {
  success,
  error,
  warning,
  info
}

class CustomNotification extends StatelessWidget {
  final String message;
  final NotificationType type;
  final bool showCloseButton;
  final double closeTime;
  final Function() onTap;

  const CustomNotification({
    super.key,
    required this.message,
    required this.type,
    required this.showCloseButton,
    required this.closeTime,
    required this.onTap,
  });

  static void show(
      BuildContext context, {
        required String message,
        NotificationType type = NotificationType.info,
        bool showCloseButton = true,
        double closeTime = 3.0,
        required Function() onTap
      }) {
    final overlayState = Overlay.of(context);
    final notificationCubit = CustomNotificationCubit();

    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => BlocProvider.value(
        value: notificationCubit,
        child: BlocBuilder<CustomNotificationCubit, CustomNotificationState>(
          builder: (context, state) {
            if (!state.isVisible) {
              overlayEntry?.remove();
              return const SizedBox();
            }

            return Positioned(
              top: MediaQuery.of(context).padding.top + 100,
              width: MediaQuery.of(context).size.width,
              child: CustomNotification(
                message: message,
                type: type,
                showCloseButton: showCloseButton,
                closeTime: closeTime,
                onTap: onTap,
              ),
            );
          },
        ),
      ),
    );

    overlayState.insert(overlayEntry);
    notificationCubit.showNotification(closeTime);
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final notificationCubit = context.read<CustomNotificationCubit>();

    return LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [

                    if (closeTime > 0)
                      TweenAnimationBuilder(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(seconds: closeTime.round()),
                        builder: (context, double value, _) {
                          return Stack(
                            children: [
                              Container(
                                width: constraints.maxWidth,
                                height: screenHeight * 0.1,
                                color: switch (type) {
                                  NotificationType.success => Colors.green,
                                  NotificationType.error => Colors.red,
                                  NotificationType.warning => Colors.orangeAccent,
                                  NotificationType.info => Colors.blue,
                                },
                              ),
                              Positioned(
                                left: 0,
                                child: Container(
                                  width: constraints.maxWidth * (1 - value),
                                  height: screenHeight * 0.1,
                                  color: Colors.black.withValues(alpha: 0.1),
                                ),
                              ),
                            ],
                          );
                        },
                      )

                    else
                      Container(
                        width: constraints.maxWidth,
                        height: screenHeight * 0.1,
                        color: switch (type) {
                          NotificationType.success => Colors.green,
                          NotificationType.error => Colors.red,
                          NotificationType.warning => Colors.orangeAccent,
                          NotificationType.info => Colors.blue,
                        },
                      ),

                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.03
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenHeight * 0.06,
                              child: Icon(
                                switch (type) {
                                  NotificationType.success => Icons.check,
                                  NotificationType.error => Icons.warning_amber,
                                  NotificationType.warning => Icons.warning_amber,
                                  NotificationType.info => Icons.warning_amber,
                                },
                                color: Colors.white,
                                size: screenHeight * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenWidth * 0.55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DefaultTextStyle(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.03,
                                    ), child: Text(message),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenHeight * 0.06,
                              child: showCloseButton
                                  ? IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: screenHeight * 0.04,
                                ),
                                onPressed: notificationCubit.hideNotification,
                              )
                                  : null,
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}

/*
Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.03,
                              right: screenWidth * 0.03
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.06,
                                width: screenHeight * 0.06,
                                child: Icon(
                                  switch (type) {
                                    'success' => Icons.check,
                                    'error' => Icons.warning_amber,
                                    'warning' => Icons.warning_amber,
                                    'info' => Icons.warning_amber,
                                    _ => Icons.warning_amber
                                  },
                                  color: Colors.white,
                                  size: screenHeight * 0.04,
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenHeight * 0.03,
                                      ), child: Text(message),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.06,
                                width: screenHeight * 0.06,
                                child: showCloseButton
                                    ? IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: screenHeight * 0.04,
                                  ),
                                  onPressed: notificationCubit.hideNotification,
                                )
                                    : null,
                              ),
                            ],
                          ),
                        )
 */

/*
Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final notificationCubit = context.read<CustomNotificationCubit>();

    return LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Stack(
                children: [
                  Container(
                      width: constraints.maxWidth,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: switch (type) {
                            'success' => Colors.green,
                            'error' => Colors.red,
                            'warning' => Colors.orangeAccent,
                            'info' => Colors.blue,
                            _ => Colors.grey
                          }
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.03,
                            right: screenWidth * 0.03
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenHeight * 0.06,
                              child: Icon(
                                switch (type) {
                                  'success' => Icons.check,
                                  'error' => Icons.warning_amber,
                                  'warning' => Icons.warning_amber,
                                  'info' => Icons.warning_amber,
                                  _ => Icons.warning_amber
                                },
                                color: Colors.white,
                                size: screenHeight * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenWidth * 0.55,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DefaultTextStyle(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenHeight * 0.03,
                                    ), child: Text(message),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.06,
                              width: screenHeight * 0.06,
                              child: showCloseButton
                                  ? IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: screenHeight * 0.04,
                                ),
                                onPressed: notificationCubit.hideNotification,
                              )
                                  : null,
                            ),
                          ],
                        ),
                      )
                  ),
                  if (closeTime > 0)
                    TweenAnimationBuilder(
                      tween: Tween(begin: 1.0, end: 0.0),
                      duration: Duration(seconds: closeTime.round()),
                      builder: (context, double value, _) {
                        return Container(
                          width: constraints.maxWidth * value,
                          height: screenHeight * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withValues(alpha: 0.3),
                          ),
                        );
                      },
                    ),
                ],
              )
            ),
          );
        }
    );
  }
 */