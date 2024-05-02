import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cut_spot/core/widget/custom_text_feild.dart';
import 'package:cut_spot/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:cut_spot/features/auth/presentation/views/register_page.dart';
import 'package:cut_spot/features/auth/presentation/views/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/Home_page.dart';
import 'widget/login_widget/donet_have_account_button.dart';
import 'widget/login_widget/forget_password_btn.dart';
import 'widget/login_widget/logo_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLodging = false;
  bool obscureText = true;
  void clearText() {
    email.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                isLodging = false;
                clearText();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ));
              } else if (state is LoginLodging) {
                isLodging = true;
              } else if (state is LoginFailure) {
                isLodging = false;

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errMessage)));
              } else if (state is ResetPasswordSuccess) {
                isLodging = false;

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content:
                        Text('An email has been sent to reset your password')));
              } else if (state is ResetPasswordFailure) {
                isLodging = false;
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errMessage)));
              }
            },
            builder: (context, state) {
              return BlurryModalProgressHUD(
                inAsyncCall: isLodging,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const LogoComponent(),
                          CustomTextFiled(
                            onChanged: (data) {
                              email.text = data;
                            },
                            controller: email,
                            hintText: 'Email',
                            withIcon: false,
                          ),
                          CustomTextFiled(
                            onChanged: (data) {
                              password.text = data;
                            },
                            controller: password,
                            hintText: 'Enter your password',
                            withIcon: true,
                            obscureText: obscureText,
                            iconButton: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          ForgetPasswordButton(
                            onTap: () async {
                              await BlocProvider.of<LoginCubit>(context)
                                  .resetPassword(email: email.text);
                            },
                          ),
                          CustomLRButton(
                            isDark: true,
                            buttonLabel: 'Log in',
                            paddingHorizontal: 0,
                            paddingVertical: 16,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await BlocProvider.of<LoginCubit>(context)
                                    .signIn(
                                        emailAddress: email.text,
                                        password: password.text);
                              }
                            },
                          ),
                          DoNetHaveAccountButton(
                            onTap: () {
                              clearText();
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
              );
            },
          ),
        ),
      ),
    );
  }
}
