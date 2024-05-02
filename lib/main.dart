import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/presentation/cubits/add_image/add_image_cubit.dart';
import 'package:cut_spot/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:cut_spot/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:cut_spot/features/auth/presentation/views/login_register_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => AddImagesCubit())
        ],
        child: MaterialApp(
          useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColor.kPrimary),
            useMaterial3: true,
          ),
          home: const LoginRegisterPage(),
        ));
  }
}
