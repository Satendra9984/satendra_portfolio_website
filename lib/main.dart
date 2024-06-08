import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/utils/colors.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/home_screen_dektop.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBarCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        scrollBehavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColours.elephant),
          useMaterial3: true,
          // fontFamily: 'FuturaNow',
          fontFamily: GoogleFonts.nunitoSans().fontFamily,
        ),
        home: const DesktopHomeScreen(),
      ),
    );
  }
}
