import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/core/widget/custom_text_feild.dart';
import 'package:cut_spot/features/auth/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';
import 'widget/register_widget/custom_stepper.dart';
import 'widget/register_widget/picture_upload.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Register',
              style: TextStyle(
                  color: AppColor.kPrimary,
                  fontWeight: FontWeight.bold,
                  height: 1,
                  fontSize: 16),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomSteppers(
                    activeStep: activeStep,
                  ),
                  const PictureUpload(),
                  const CustomTextFiled(
                    hintText: 'Full Name',
                    withIcon: false,
                  ),
                  const CustomTextFiled(
                    hintText: 'Email',
                    withIcon: false,
                  ),
                  const CustomTextFiled(
                    hintText: 'Phone number',
                    withIcon: false,
                  ),
                  CustomTextFiled(
                    hintText: 'Password',
                    withIcon: true,
                    iconButton: () {},
                  ),
                  CustomLRButton(
                    onTap: () {
                      setState(() {
                        activeStep++;
                      });
                    },
                    isDark: true,
                    buttonLabel: 'Register',
                    paddingHorizontal: 0,
                    paddingVertical: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
