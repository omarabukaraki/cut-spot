import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/widget/login_register_widget/custom_lr_button.dart';
import 'package:cut_spot/features/select_time/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import '../Booking_details/booking_details_page.dart';
import 'widget/available_time_component.dart';
import 'widget/custom_calender_btn.dart';
import 'widget/date_information.dart';

class DisplayTimeSlot extends StatefulWidget {
  const DisplayTimeSlot({super.key});

  @override
  State<DisplayTimeSlot> createState() => _DisplayTimeSlotState();
}

class _DisplayTimeSlotState extends State<DisplayTimeSlot> {
  @override

  // ignore: override_on_non_overriding_member
  DateTime now = DateTime.now();
  var selectedTime = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: AppColor.kWGray,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColor.kFontGray,
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DateInformation(now: now),
              CustomCalenderBtn(
                onTap: () async {
                  await DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    minTime: now,
                    maxTime: now.add(const Duration(days: 31)),
                    onConfirm: (time) {
                      setState(() {
                        now = time;
                      });
                    },
                  );
                },
              )
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            itemCount: TIME_SLOTS.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTime = TIME_SLOTS.elementAt(index);
                    print(selectedTime);
                  });
                },
                child: AvailableTimeComponent(
                  isSelected: selectedTime != TIME_SLOTS.elementAt(index),
                  time: TIME_SLOTS.elementAt(index),
                  status: 'Available',
                ),
              );
            },
          ),
        )),
        CustomLRButton(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const BookingDetailsPage();
              },
            ));
          },
          isDark: true,
          buttonLabel: 'Next',
          paddingVertical: 16,
          paddingHorizontal: 16,
        )
      ],
    );
  }
}
