import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class DescriptionHomePage extends StatelessWidget {
  const DescriptionHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Text(
        'Choose the service you want',
        style: TextStyle(color: AppColor.kFontGray, height: 1, fontSize: 12),
      ),
    );
  }
}

class HeaderTextHome extends StatelessWidget {
  const HeaderTextHome({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(text ?? 'Welcome to Cut Spot Salon!',
          style: const TextStyle(
              color: AppColor.kPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 14)),
    );
  }
}
