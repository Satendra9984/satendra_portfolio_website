import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_portfolio_website/views/about_me/about_me_mobile_screen.dart';
import 'package:personal_portfolio_website/views/experience/experience_mobile_screen.dart';
import 'package:personal_portfolio_website/views/my_skills/my_skills_desktop.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/experience/experience_desktop_screen.dart';
import 'package:personal_portfolio_website/views/about_me/about_me_screen.dart';
import 'package:personal_portfolio_website/views/my_skills/my_skills_mobile.dart';
import 'package:personal_portfolio_website/views/projects/project_desktop_screen.dart';
import 'package:personal_portfolio_website/views/projects/project_mobile_screen.dart';
import 'package:personal_portfolio_website/views/responsive_screens_wrapper.dart';
import 'package:personal_portfolio_website/views/widgets/neumorphic_buttons.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        return BlocBuilder<AppBarCubit, AppBarState>(
          builder: (context, state) {
            var appbarcubit = context.watch<AppBarCubit>();
            return Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: PageView(
                controller: appbarcubit.pageController,
                onPageChanged: (page) {
                  appbarcubit.setNewAppBar(page);
                },
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // const ResponsiveScreenWrapperWidget(
                  //     mobileScreen: MyExperienceMobileScreen(),
                  //     desktopScreen: MyExperienceDesktopScreen()),
                  const ResponsiveScreenWrapperWidget(
                      mobileScreen: PortfolioHomePageMobile(),
                      desktopScreen: PortfolioHomePage()),
                  ResponsiveScreenWrapperWidget(
                      mobileScreen: AboutMeMobileScreen(),
                      desktopScreen: AboutMeDesktopScreen()),
                  const ResponsiveScreenWrapperWidget(
                      mobileScreen: MyExperienceMobileScreen(),
                      desktopScreen: MyExperienceDesktopScreen()),
                  ResponsiveScreenWrapperWidget(
                      mobileScreen: MyProjectsMobileScreen(),
                      desktopScreen: MyProjectsDesktopScreen()),
                ],
              ),
              bottomNavigationBar: width < 950
                  ? Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          appbarcubit.appBarList.length,
                          (index) {
                            var appbardata = appbarcubit.appBarList[index];
                            bool selected =
                                state.currentSelectedAppBar == index;
                            return GestureDetector(
                              onTap: () {
                                // appbarcubit.setNewAppBar(index);
                              },
                              child: AnimatedNeumorphicButtons(
                                onPress: () {
                                  appbarcubit.setNewAppBar(index);
                                },
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                isDark: state.currentSelectedAppBar == index,
                                child: Icon(
                                  appbardata.iconData,
                                  color: selected
                                      ? Colors.grey.shade300
                                      : Colors.grey.shade900,
                                  size: selected ? 32.0 : 24.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
