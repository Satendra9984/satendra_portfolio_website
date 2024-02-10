import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/utils/colors.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/widgets/app_bar_tile.dart';
import 'package:personal_portfolio_website/views/widgets/neumorphic_buttons.dart';
import 'dart:ui' as ui;

class PortfolioHomePage extends StatelessWidget {
  PortfolioHomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final LinearGradient gradient = const LinearGradient(
    colors: [AppColours.orange, AppColours.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final LinearGradient greenishgradient = const LinearGradient(
    colors: [
      AppColours.eden,
      AppColours.bigStone,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screenWidth = size.width;
    if (screenWidth >= 824) screenWidth = 824;

    if (screenWidth <= 400) {
      screenWidth = 420;
    }

    double multiplier = screenWidth / 824;

    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.grey.shade300,
          appBar: width <= 650
              ? AppBar(
                  backgroundColor: Colors.grey.shade300,
                  title: Text(
                    'theWatcher',
                    style: GoogleFonts.play(
                      // play, playfair, pacifico, incosonata
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                        icon: const Icon(Icons.menu))
                  ],
                )
              : null,
          endDrawer: width <= 650 ? getSingleDrawer(context) : null,
          body: Column(
            children: [
              // Header
              if (width > 650)
                Container(
                  margin: const EdgeInsets.only(left: 42.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'theWatcher',
                        style: GoogleFonts.play(
                          // play, playfair, pacifico, incosonata
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 24.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      getDrawer(context),
                    ],
                  ),
                ),

              // Body
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // <------------------  Intro Part ---------------------->

                              if (width <= 950)
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(multiplier * 100),
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundColor: Colors.transparent,
                                    child: SvgPicture.asset(
                                      'assets/images/personality_1.svg',
                                      semanticsLabel: 'Personality',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              SizedBox(height: multiplier * 40),

                              Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                    ' I am',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: multiplier * 52,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (rect) {
                                      return gradient.createShader(rect);
                                    },
                                    child: Text(
                                      ' Satendra Pal',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: multiplier * 48,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ' an',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: multiplier * 52,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (rect) {
                                      return gradient.createShader(rect);
                                    },
                                    child: Text(
                                      ' Engineer',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: multiplier * 48,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ' and I Build',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: multiplier * 52,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (rect) {
                                      return gradient.createShader(rect);
                                    },
                                    child: Text(
                                      ' Solutions.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: multiplier * 48,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: multiplier * 40),

                              Text(
                                '''I am a seasoned full-stack software engineer with over8 years of professional experience, specializing in backend development.My expertise lies in crafting robust and scalable SaaS-basedarchitectures on the Amazon AWS platform.''',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width <= 950 ? 14 : 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: multiplier * 56),

                              // <------------------- About --------------------------- >
                              Wrap(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                runAlignment: WrapAlignment.spaceBetween,
                                children: [
                                  AnimatedNeumorphicButtons(
                                    onPress: () {},
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: const Text(
                                      'Get In Touch',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  AnimatedNeumorphicButtons(
                                    onPress: () {},
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    isDark: true,
                                    child: const Text(
                                      'Download CV',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (width > 950)
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: SvgPicture.asset(
                                'assets/images/personality_1.svg',
                                semanticsLabel: 'Personality',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget getDrawer(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarState>(
      builder: (context, state) {
        var appbarcubit = context.read<AppBarCubit>();
        List<AppBarData> list = appbarcubit.appBarList;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            list.length,
            (index) => GestureDetector(
              onTap: () {
                context.read<AppBarCubit>().setNewAppBar(index);
              },
              child: AppBarTile(
                index: index,
                iconData: list[index].iconData,
                title: list[index].title,
                isCurrent: state.currentSelectedAppBar == index,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getSingleDrawer(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: 170.0,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
        ),
        child: BlocBuilder<AppBarCubit, AppBarState>(
          builder: (context, state) {
            var appbarcubit = context.read<AppBarCubit>();
            List<AppBarData> list = appbarcubit.appBarList;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                list.length,
                (index) {
                  bool selected = index == state.currentSelectedAppBar;
                  return Container(
                    color: selected
                        ? Colors.grey.shade900
                        : Colors.grey.shade300,
                    child: ListTile(
                      selected: selected,
                      onTap: () {
                        appbarcubit.setNewAppBar(index);
                      },
                      dense: true,
                      selectedTileColor: Colors.grey.shade900,
                      leading: Icon(
                        list[index].iconData,
                        color: selected
                            ? Colors.grey.shade300
                            : Colors.grey.shade900,
                        size: 18.0,
                      ),
                      title: Text(
                        list[index].title,
                        style: GoogleFonts.play(
                          // play, playfair, pacifico, incosonata
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? Colors.grey.shade300
                              : Colors.grey.shade900,
                          fontSize: 16.0,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }



}
