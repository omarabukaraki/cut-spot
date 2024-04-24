import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 7,
        ),
        Image.asset(
          'assets/images/Logo (1).png',
          width: 60,
          height: 60,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 26,
        ),
        const Text(
          'Welcome back.',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.kPrimary,
              fontWeight: FontWeight.bold,
              height: 1,
              fontSize: 30),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
      ],
    );
  }
}
