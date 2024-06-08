import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/core/dummy_experience_data.dart';
import 'package:personal_portfolio_website/core/network/http_utils.dart';
import 'package:personal_portfolio_website/models/experience_data_model.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/widgets/experience_tile.dart';
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                        color: Colors.white,
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
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 44, vertical: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Work Experiences',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 32.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // List of projects
                      Expanded(
                        child: SizedBox(
                          width: size.width > 760 ? 760 : size.width,
                          child: AlignedGridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 1,
                            physics: const BouncingScrollPhysics(),
                            itemCount: _experiences.length,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            itemBuilder: (context, index) {
                              return ExperienceTile(
                                model: _experiences[index],
                              );
                            },
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
                    color: isCurrent ? Colors.black : Colors.white,
                    size: 16.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isCurrent ? Colors.black : Colors.white,
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

}

