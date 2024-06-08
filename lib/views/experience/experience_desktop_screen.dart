import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/core/dummy_experience_data.dart';
import 'package:personal_portfolio_website/core/network/http_utils.dart';
import 'package:personal_portfolio_website/models/experience_data_model.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class MyExperienceDesktopScreen extends StatefulWidget {
  const MyExperienceDesktopScreen({super.key});

  @override
  State<MyExperienceDesktopScreen> createState() =>
      _MyExperienceDesktopScreenState();
}

class _MyExperienceDesktopScreenState extends State<MyExperienceDesktopScreen> {
  int currentExperienceSelected = -1;

  late final List<ExperienceDataModel> _experiences;

  Future<void> setExperiences() async {
    if (_experiences.isEmpty) {
      _experiences.addAll(await HttpUtils.getExperienceList());
    }
  }

  @override
  void initState() {
    _experiences = experiences;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const RiveAnimation.asset(
              'assets/animations/pull_to_refresh.riv',
            ),
          ),
          Column(
            children: [
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
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 44, vertical: 32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Work Experiences',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 32.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // List of projects

                            Expanded(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _experiences.length,
                                itemBuilder: (context, index) {
                                  return experienceTile(
                                    _experiences[index],
                                    index,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 32.0, horizontal: 24),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
            (index) => navigationElement(
              iconData: list[index].iconData,
              title: list[index].title,
              index: index,
              isCurrent: state.currentSelectedAppBar == index,
            ),
          ),
        );
      },
    );
  }

  Widget navigationElement({
    required IconData iconData,
    required String title,
    required int index,
    required bool isCurrent,
  }) {
    // double offset = 1.0;
    // double blurradius = 1.0;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          context.read<AppBarCubit>().setNewAppBar(index);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    iconData,
                    color: isCurrent ? Colors.white : Colors.black,
                    size: 16.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isCurrent ? Colors.white : Colors.black,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget experienceTile(ExperienceDataModel model, int index) {
    // double offset = 1;
    // double blurRadius = 1.0;
    return GestureDetector(
      onTap: () {
        if (currentExperienceSelected == -1) {
          setState(() {
            currentExperienceSelected = index;
          });
        } else {
          setState(() {
            currentExperienceSelected = -1;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.transparent,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(8.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.role,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            // color: Colors.grey.shade100,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Text(
                        '${model.startDate}-${model.endDate}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          // color: Colors.grey.shade100,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '@ ${model.company}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      // color: Colors.grey.shade100,
                      fontSize: 14.0,
                    ),
                  ),
                  if (currentExperienceSelected == index)
                    Column(
                      children: [
                        const SizedBox(height: 12.0),
                        Text(
                          model.experience,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            // color: Colors.grey.shade100,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
