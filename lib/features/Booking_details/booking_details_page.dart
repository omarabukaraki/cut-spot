import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/presentation/views/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';
import 'widget/custom_invoice.dart';
import 'widget/payment_component.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({super.key});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  int? selectedItem;
  List<String> images = ['assets/images/card.png', 'assets/images/cash.png'];
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomInvoice(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 8,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = index;
                        });
                      },
                      child: PaymentComponent(
                        isSelected: selectedItem != index,
                        image: images[index],
                      ));
                },
              ),
            ),
            selectedItem == 0
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.85,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xffDDDDDD)),
                    ),
                    child: const Column(
                      children: [
                        CustomBookingTextField(),
                        CustomBookingTextField(
                          hintText: 'CARD NUMBER (1234 **** **** 7890)',
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            CustomHalfTextField(),
                            CustomDivider(),
                            CustomHalfTextField(
                              hintText: 'CVV (***)',
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(left: 32),
        child: CustomLRButton(isDark: true, buttonLabel: 'Next'),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 1,
      color: const Color(0xffDDDDDD),
    );
  }
}

class CustomHalfTextField extends StatelessWidget {
  const CustomHalfTextField({super.key, this.hintText});
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration:
                const BoxDecoration(border: Border(bottom: BorderSide.none)),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: hintText ?? 'VALID THRU',
                  hintStyle:
                      const TextStyle(fontSize: 12, color: Color(0xff888888)),
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            )));
  }
}

class CustomBookingTextField extends StatelessWidget {
  const CustomBookingTextField(
      {super.key, this.withBorder = true, this.hintText});
  final bool withBorder;
  final String? hintText;

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
        child: TextFormField(
          decoration: InputDecoration(
              hintText: hintText ?? 'FULL NAME',
              hintStyle:
                  const TextStyle(fontSize: 12, color: Color(0xff888888)),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ));
  }
}
