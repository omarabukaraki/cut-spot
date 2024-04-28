import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/select_time/display_time_slot.dart';
import 'package:flutter/material.dart';

class SelectTimePage extends StatelessWidget {
  const SelectTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Cut Spot',
            style: TextStyle(
                color: AppColor.kPrimary,
                fontWeight: FontWeight.bold,
                height: 1,
                fontSize: 18)),
        centerTitle: true,
      ),
      body: const DisplayTimeSlot(),
    );
  }
}
