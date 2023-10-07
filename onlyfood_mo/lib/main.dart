import 'package:flutter/material.dart';
import 'package:onlyfood_mo/responsive/mobile_screen_layout.dart';
import 'package:onlyfood_mo/responsive/responsive_layout_screen.dart';
import 'package:onlyfood_mo/responsive/web_screen_layout.dart';
import 'package:onlyfood_mo/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Only Food',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const ResponsiveLayoutScreen(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ));
  }
}
