import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class PaymentComponent extends StatelessWidget {
  const PaymentComponent(
      {super.key, required this.isSelected, required this.image});
  final bool isSelected;
  final String image;

  @override
  Widget build(BuildContext context) {
    return isSelected == true
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColor.kFontGray, width: 0.5),
            ),
            margin: const EdgeInsets.all(4),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(image),
                  ),
                ),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: AppColor.kPrimary,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColor.kPrimary, width: 0.5),
            ),
            margin: const EdgeInsets.all(4),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      image,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
