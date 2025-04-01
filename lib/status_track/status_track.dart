import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_service.dart';
import 'ST_SM/ST_Bloc.dart';
import 'ST_SM/ST_State.dart';

class StatusTrack extends StatelessWidget {
  final List<IconData> icons;
  final Color inactiveTrackColor;
  final Color activeTrackColor;
  final double conWidth = 4;
  final double cirSize = 30;
  final String orderId;
  final ApiService apiService;

  StatusTrack({
   super.key,
   this.icons = const [
     Icons.access_time_filled,
     Icons.time_to_leave,
     Icons.check_circle_outline
   ],
    required this.inactiveTrackColor,
    required this.activeTrackColor,
    required this.orderId,
    required this.apiService
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatusTrackBloc, StatusTrackState> (
        builder: (context, state) {
          return Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  child: Column(
                    children: [

                      //status 1-2
                      Expanded(
                        child: Container(
                          color: state.currentStatus >= 1
                              ? activeTrackColor
                              : inactiveTrackColor,
                          width: conWidth,
                        ),
                      ),

                      //status 2-3
                      Expanded(
                        child: Container(
                          color: state.currentStatus >= 2
                              ? activeTrackColor
                              : inactiveTrackColor,
                          width: conWidth,
                        ),
                      ),
                    ],
                  ),
                ),

                //status 1 indicator
                Positioned(
                  top: 0 - cirSize/2,
                  child: Container(
                    width: cirSize + 5,
                    height: cirSize + 5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: cirSize,
                        height: cirSize,
                        decoration: BoxDecoration(
                          color: state.currentStatus >= 1
                              ? activeTrackColor
                              : inactiveTrackColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icons[0],
                          size: 22.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                //status 2 indicator
                Positioned(
                  top: 150 - cirSize/2,
                  child: Container(
                    width: cirSize + 5,
                    height: cirSize + 5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: cirSize,
                        height: cirSize,
                        decoration: BoxDecoration(
                          color: state.currentStatus >= 2
                              ? activeTrackColor
                              : inactiveTrackColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icons[1],
                          size: 22.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                //status 3 indicator
                Positioned(
                  bottom: 0 - cirSize/2,
                  child: Container(
                    width: cirSize + 5,
                    height: cirSize + 5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: cirSize,
                        height: cirSize,
                        decoration: BoxDecoration(
                          color: state.currentStatus >= 3
                              ? activeTrackColor
                              : inactiveTrackColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icons[2],
                          size: 22.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        }
    );
  }
}