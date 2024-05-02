import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/presentation/views/login_page.dart';
import 'package:cut_spot/features/auth/presentation/views/register_page.dart';
import 'package:flutter/material.dart';
import 'custom_lr_button.dart';

class BodyLRPage extends StatelessWidget {
  const BodyLRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          'assets/images/Logo (1).png',
          width: 60,
          height: 60,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 24,
        ),
        const Text(
          'Book your haircut in seconds',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.kPrimary,
              fontWeight: FontWeight.bold,
              height: 1,
              fontSize: 30),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            'Schedule your next haircut within a few seconds. Easily reserve and manage your appointments.',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: AppColor.kFontGray, height: 1, fontSize: 12),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 24,
        ),
        CustomLRButton(
          isDark: true,
          buttonLabel: 'Log in',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ));
          },
        ),
        CustomLRButton(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const RegisterPage();
              },
            ));
          },
          isDark: false,
          buttonLabel: 'Register',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 12,
        ),
      ],
    );
  }
}
