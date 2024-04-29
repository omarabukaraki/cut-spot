import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class AvailableTimeComponent extends StatelessWidget {
  const AvailableTimeComponent(
      {super.key,
      required this.time,
      required this.status,
      this.isSelected = false});
  final String time;
  final String status;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected == true
        ? Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                // color: AppColor.kWGray,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColor.kFontGray)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: AppColor.kPrimary,
                  ),
                  Text(status,
                      style: const TextStyle(color: AppColor.kPrimary)),
                  Text(
                    time,
                    style:
                        const TextStyle(fontSize: 12, color: AppColor.kPrimary),
                  ),
                ],
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppColor.kPrimary,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColor.kPrimary)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                  ),
                  Text(status, style: const TextStyle(color: Colors.white)),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
  }
}
