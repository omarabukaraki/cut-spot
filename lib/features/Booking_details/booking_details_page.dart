import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/widget/login_register_widget/custom_lr_button.dart';
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
      body: Column(
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
          )
        ],
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(left: 32),
        child: CustomLRButton(isDark: true, buttonLabel: 'Next'),
      ),
    );
  }
}
