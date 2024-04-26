import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/login_register_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   // enabled: !kReleaseMode,
  //   builder: (context) => MyApp(), // Wrap your app
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
        useMaterial3: true,
      ),
      home: const LoginRegisterPage(),
    );
  }
}
