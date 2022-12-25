import 'package:discus_mobile/config/app_color.dart';
import 'package:discus_mobile/config/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Discuss App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColor.primary,
        ),
      ),
      routerConfig: AppRoute.routerConfig,
    );
  }
}
