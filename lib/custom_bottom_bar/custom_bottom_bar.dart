import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_1/custom_bottom_bar/CBB_SM/CBB_State.dart';

import 'CBB_SM/CBB_Cubit.dart';

class CustomBottomBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Color splashColor;
  final Color backgroundColor;

  const CustomBottomBar({
    Key? key,
    required this.icons,
    required this.onTap,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.splashColor = Colors.lightBlueAccent,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomBottomBarCubit(),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            icons.length,
                (index) => _buildNavItem(context, icons[index], index),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context,
      IconData icon,
      int index,
      ) {

    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<CustomBottomBarCubit, CustomBottomBarState>(
      builder: (context, state) {
        final bool isSelected = state.selectedIndex == index;
        return Expanded(
          child: Material(
            color: backgroundColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              //radius: 15,
              splashColor: splashColor.withValues(alpha: 0.2),
              onTap: () {
                context.read<CustomBottomBarCubit>().updateIndex(index);
                onTap(index);
              },
              child: Container(
                height: 60,
                child: Center(
                  child: Icon(
                    icon,
                    color: isSelected ? selectedColor : unselectedColor,
                    size: screenWidth * 0.06,
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