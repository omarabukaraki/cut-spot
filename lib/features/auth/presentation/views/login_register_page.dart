import 'package:cut_spot/features/auth/presentation/views/widget/login_register_widget/body_lr_page.dart';
import 'package:flutter/material.dart';

import 'widget/login_register_widget/background_lr_page.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        alignment: Alignment(0, 0),
        children: [BackGroundLRPage(), BodyLRPage()],
      ),
    );
  }
}
