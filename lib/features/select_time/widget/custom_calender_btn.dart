import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomCalenderBtn extends StatelessWidget {
  const CustomCalenderBtn({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.calendar_today,
            color: AppColor.kPrimary,
          ),
        ),
      ),
    );
  }
}
