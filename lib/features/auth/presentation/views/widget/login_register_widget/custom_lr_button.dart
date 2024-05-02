import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomLRButton extends StatelessWidget {
  const CustomLRButton(
      {super.key,
      required this.isDark,
      required this.buttonLabel,
      this.onTap,
      this.paddingHorizontal,
      this.paddingVertical});
  final bool isDark;
  final String buttonLabel;
  final VoidCallback? onTap;
  final double? paddingHorizontal;
  final double? paddingVertical;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: paddingHorizontal ?? 16,
            vertical: paddingVertical ?? 8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.kPrimary),
          borderRadius: BorderRadius.circular(4),
          color: isDark ? AppColor.kPrimary : Colors.white,
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: TextStyle(color: isDark ? Colors.white : AppColor.kPrimary),
          ),
        ),
      ),
    );
  }
}
