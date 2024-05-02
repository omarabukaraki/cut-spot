import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/core/widget/custom_text_feild.dart';
import 'package:cut_spot/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:cut_spot/features/auth/presentation/views/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/add_image/add_image_cubit.dart';
import 'widget/register_widget/custom_stepper.dart';
import 'widget/register_widget/picture_upload.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int activeStep = 0;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  bool isSelect = false;
  String imageUrl = '';
  bool obscureText = true;

  void clearText() {
    email.clear();
    password.clear();
    fullName.clear();
    phoneNumber.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
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
                    BlocConsumer<AddImagesCubit, AddImagesState>(
                      listener: (context, state) {
                        if (state is UploadImagesSuccess) {
                          imageUrl = state.url[0];
                          isSelect = true;
                          activeStep++;
                        }
                      },
                      builder: (context, state) {
                        return PictureUpload(
                          isSelect: isSelect,
                          onTap: () async {
                            await BlocProvider.of<AddImagesCubit>(context)
                                .pickImageFromGallery(index: 0);
                          },
                        );
                      },
                    ),
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterSuccess) {
                          clearText();
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A verification message has been sent to your email")));
                        } else if (state is RegisterFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errMassage)));
                        }
                      },
                      builder: (context, state) {
                        return Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFiled(
                                controller: fullName,
                                hintText: 'Full Name',
                                withIcon: false,
                                onChanged: (data) {
                                  fullName.text = data;
                                },
                              ),
                              CustomTextFiled(
                                controller: email,
                                hintText: 'Email',
                                withIcon: false,
                                onChanged: (data) {
                                  email.text = data;
                                },
                              ),
                              CustomTextFiled(
                                controller: phoneNumber,
                                hintText: 'Phone number',
                                withIcon: false,
                                onChanged: (data) {
                                  phoneNumber.text = data;
                                },
                              ),
                              CustomTextFiled(
                                controller: password,
                                hintText: 'Password',
                                withIcon: true,
                                obscureText: obscureText,
                                iconButton: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                onChanged: (data) {
                                  password.text = data;
                                  if (data.isNotEmpty &&
                                      activeStep == 1 &&
                                      activeStep < 2) {
                                    activeStep++;
                                  }
                                },
                              ),
                              CustomLRButton(
                                onTap: () async {
                                  if (imageUrl != '') {
                                    if (formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                        if (activeStep > 1) {
                                          activeStep++;
                                        }
                                      });
                                      await BlocProvider.of<RegisterCubit>(
                                              context)
                                          .createUser(
                                              email: email.text,
                                              password: password.text,
                                              name: fullName.text,
                                              phoneNumber: phoneNumber.text,
                                              image: imageUrl);
                                      BlocProvider.of<AddImagesCubit>(context)
                                          .url = [];
                                      setState(() {
                                        activeStep = 0;
                                        imageUrl = '';
                                        isSelect = false;
                                        isLoading = false;
                                      });
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('please enter image')));
                                  }
                                },
                                isDark: true,
                                buttonLabel: 'Register',
                                paddingHorizontal: 0,
                                paddingVertical: 16,
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
