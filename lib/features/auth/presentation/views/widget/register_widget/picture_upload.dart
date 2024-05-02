import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class PictureUpload extends StatelessWidget {
  const PictureUpload({super.key, this.onTap, this.isSelect = false});
  final VoidCallback? onTap;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColor.kFontGray)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(isSelect != true ? Icons.add_circle : Icons.check_circle),
            const SizedBox(
              width: 10,
            ),
            const Text('Choose your profile picture')
          ],
        ),
      ),
    );
  }
}
