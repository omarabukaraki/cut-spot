import 'package:cut_spot/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomInvoice extends StatelessWidget {
  const CustomInvoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.35,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xffDDDDDD)),
      ),
      child: const Column(
        children: [
          BookingDetailsItem(
            leftText: 'Your services',
            rightText: '',
          ),
          BookingDetailsItem(
            leftText: 'Place of service',
            rightText: '',
            image: 'assets/images/Vector.png',
          ),
          BookingDetailsItem(
            leftText: 'Booking time',
            rightText: '',
            image: 'assets/images/calendar.png',
          ),
          BookingDetailsItem(
            leftText: 'Your barber',
            rightText: '',
            image: 'assets/images/user.png',
          ),
          BookingDetailsItem(
            leftText: 'Total price',
            rightText: '6 JD',
            withBorder: false,
            image: 'assets/images/dollar-square.png',
          ),
        ],
      ),
    );
  }
}

class BookingDetailsItem extends StatelessWidget {
  const BookingDetailsItem(
      {super.key,
      this.image,
      required this.leftText,
      required this.rightText,
      this.withBorder = true});
  final String leftText;
  final String rightText;
  final bool withBorder;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
          border: Border(
              bottom: withBorder == true
                  ? const BorderSide(color: Color(0xffDDDDDD))
                  : BorderSide.none)),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    image ?? 'assets/images/scissor.png',
                    color: AppColor.kPrimary,
                    width: 16,
                    height: 16,
                  ),
                ),
                Text(
                  leftText,
                  style: const TextStyle(color: Color(0xff888888)),
                ),
              ],
            )),
          )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: 1,
            color: const Color(0xffDDDDDD),
          ),
          Expanded(
              child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              rightText,
              style: const TextStyle(color: Color(0xff888888)),
            )),
          )),
        ],
      ),
    );
  }
}
