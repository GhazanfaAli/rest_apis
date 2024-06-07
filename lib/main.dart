
import 'package:company/main_menu.dart';
import 'package:company/main_page.dart';
import 'package:company/products.dart';
import 'package:company/service.dart';
import 'package:company/services/arbic_holy_Quran.dart';
import 'package:company/services/holy_quran.dart';
import 'package:company/services/quote_servies.dart';
import 'package:company/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home:SplashScreen(),
    );
  }
}
