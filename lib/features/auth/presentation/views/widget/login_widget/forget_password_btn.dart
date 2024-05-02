import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
            onTap: onTap,
            child: const Text(
              'Forget password?',
              style:
                  TextStyle(color: AppColor.kFontGray, height: 1, fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
