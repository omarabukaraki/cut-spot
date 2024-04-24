import 'package:cut_spot/core/widget/custom_text_feild.dart';
import 'package:cut_spot/features/auth/register_page.dart';
import 'package:cut_spot/features/auth/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';
import 'widget/login_widget/donet_have_account_button.dart';
import 'widget/login_widget/forget_password_btn.dart';
import 'widget/login_widget/logo_component.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LogoComponent(),
                  const CustomTextFiled(
                    hintText: 'Email',
                    withIcon: false,
                  ),
                  CustomTextFiled(
                    hintText: 'Enter your password',
                    withIcon: true,
                    iconButton: () {},
                  ),
                  ForgetPasswordButton(
                    onTap: () {},
                  ),
                  const CustomLRButton(
                    isDark: true,
                    buttonLabel: 'Log in',
                    paddingHorizontal: 0,
                    paddingVertical: 16,
                  ),
                  DoNetHaveAccountButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
