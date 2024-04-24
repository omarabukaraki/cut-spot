import 'package:cut_spot/core/utils/app_color.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class CustomSteppers extends StatelessWidget {
  const CustomSteppers(
      {super.key, this.title, this.onStepReached, required this.activeStep});

  final void Function(int)? onStepReached;
  final int activeStep;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0.7),
      children: [
        EasyStepper(
          internalPadding: 0,
          defaultStepBorderType: BorderType.normal,
          activeStepBorderColor: Colors.black,
          activeStep: activeStep,
          // lineLength: 50,
          lineStyle: const LineStyle(
            activeLineColor: Color(0xffF4F4F4),
            defaultLineColor: Color(0xffF4F4F4),
            unreachedLineColor: Color(0xffF4F4F4),
            lineType: LineType.normal,
          ),
          stepShape: StepShape.rRectangle,
          stepBorderRadius: 50,
          borderThickness: 2,
          padding: const EdgeInsets.all(20),
          stepRadius: 28,
          finishedStepBorderColor: const Color(0xffF4F4F4),
          finishedStepTextColor: const Color(0xffF4F4F4),
          finishedStepBackgroundColor: const Color(0xffF4F4F4),
          activeStepIconColor: const Color(0xffF4F4F4),
          showLoadingAnimation: false,
          steps: [
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 0 ? 1 : 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.asset('assets/images/gallery.png'),
                  ),
                ),
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 1 ? 1 : 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.asset('assets/images/user-square.png'),
                  ),
                ),
              ),
            ),
            EasyStep(
              customStep: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Opacity(
                  opacity: activeStep >= 2 ? 1 : 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.asset('assets/images/tick-square.png'),
                  ),
                ),
              ),
            ),
          ],
          // onStepReached: onStepReached,
        ),
        Text(
          title ?? 'Personal Information',
          style: const TextStyle(color: AppColor.kPrimary, fontSize: 22),
        ),
      ],
    );
  }
}
