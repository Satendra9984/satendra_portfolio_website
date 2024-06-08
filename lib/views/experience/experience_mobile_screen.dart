import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/core/dummy_experience_data.dart';
import 'package:personal_portfolio_website/models/experience_data_model.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/widgets/experience_tile.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class MyExperienceMobileScreen extends StatefulWidget {
  const MyExperienceMobileScreen({super.key});

  @override
  State<MyExperienceMobileScreen> createState() =>
      _MyExperienceDesktopScreenState();
}

class _MyExperienceDesktopScreenState extends State<MyExperienceMobileScreen> {
  int currentExperienceSelected = -1;

  late final List<ExperienceDataModel> _experiences;

  @override
  void initState() {
    _experiences = experiences;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: size.width,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              blendMode: BlendMode.srcOver,
              child: const RiveAnimation.asset(
                'assets/animations/pull_to_refresh_.riv',
                fit: BoxFit.cover,
                behavior: RiveHitTestBehavior.transparent,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32.0),
              const Text(
                'Work Experiences',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SizedBox(
                  width: size.width > 600 ? 600 : size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _experiences.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                        child: ExperienceTile(
                         model: _experiences[index],
                          
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
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
                    color:
                        selected ? Colors.grey.shade900 : Colors.grey.shade300,
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
