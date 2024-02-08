import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/utils/colors.dart';
import 'package:personal_portfolio_website/views/home/home_screen_dektop.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColours.elephant),
        useMaterial3: true,
        fontFamily: 'FuturaNow',
      ),
      home: const DesktopHomeScreen(),
    );
  }
}
