import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomServicesComponent extends StatelessWidget {
  const CustomServicesComponent(
      {super.key, this.image, this.title, this.height, this.width});
  final String? image;
  final String? title;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColor.kFontGray, width: 0.5),
        // color: AppColor.kWGray,
      ),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(image ?? 'assets/images/salon.png'),
            ),
          ),
          Text(
            title ?? 'Hair cu',
            style: const TextStyle(color: AppColor.kPrimary, fontSize: 12),
          )
        ],
      ),
    );
  }
}
