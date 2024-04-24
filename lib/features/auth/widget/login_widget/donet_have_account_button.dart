import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class DoNetHaveAccountButton extends StatelessWidget {
  const DoNetHaveAccountButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have an account?",
            style:
                TextStyle(color: AppColor.kFontGray, height: 1, fontSize: 12),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              " Register now",
              style:
                  TextStyle(color: AppColor.kPrimary, height: 1, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
