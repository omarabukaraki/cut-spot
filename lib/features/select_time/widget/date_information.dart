import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInformation extends StatelessWidget {
  const DateInformation({super.key, required this.now});
  final DateTime now;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              DateFormat.MMMM().format(now),
              style: const TextStyle(
                color: AppColor.kPrimary,
              ),
            ),
            Text(
              now.day.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColor.kPrimary,
              ),
            ),
            Text(
              DateFormat.EEEE().format(now),
              style: const TextStyle(
                color: AppColor.kPrimary,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
