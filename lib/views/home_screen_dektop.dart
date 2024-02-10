import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio_website/views/experience/experience_mobile_screen.dart';
import 'package:personal_portfolio_website/views/my_skills/my_skills_desktop.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/experience/experience_desktop_screen.dart';
import 'package:personal_portfolio_website/views/about_me/about_me_screen.dart';
import 'package:personal_portfolio_website/views/my_skills/my_skills_mobile.dart';
import 'package:personal_portfolio_website/views/projects/project_desktop_screen.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: BlocBuilder<AppBarCubit, AppBarState>(
        builder: (context, state) {
          var appbarcubit = context.read<AppBarCubit>();
          return PageView(
            controller: appbarcubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const MyExperienceMobileScreen(),
              AboutMeMobileScreen(),
              PortfolioHomePage(),
              // AboutMeDesktopScreen(),

              MyProjectsDesktopScreen(),
            ],
          );
        },
      ),
    );
  }
}
