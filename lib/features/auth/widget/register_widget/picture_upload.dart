import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class PictureUpload extends StatelessWidget {
  const PictureUpload({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColor.kFontGray)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle),
              SizedBox(
                width: 10,
              ),
              Text('Choose a file')
            ],
          ),
        ),
      ],
    );
  }
}
