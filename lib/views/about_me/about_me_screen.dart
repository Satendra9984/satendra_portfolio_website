import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/utils/colors.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/get_in_touch/contacts_sheet.dart';
import 'package:personal_portfolio_website/views/widgets/app_bar_tile.dart';
import 'package:personal_portfolio_website/views/widgets/neumorphic_buttons.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:url_launcher/url_launcher.dart';

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});
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

  void openUrl(String url) async {
    final storage = FirebaseStorage.instance;
    String path = await storage.ref('SatendraPalResume.pdf').getDownloadURL();
    // debugPrint(path);

    launchUrl(
      Uri.parse(path),
      webOnlyWindowName: "_blank",
    );
  }

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
        // double width = constraints.maxWidth;

        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Column(
            children: [
              // Header
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
                    // height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
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
                              Column(
                                // runAlignment: WrapAlignment.spaceBetween,
                                children: [
                                  AnimatedNeumorphicButtons(
                                    onPress: () {
                                      openUrl(
                                          'gs://mypersonalwebsite-d3dec.appspot.com/SatendraPalResume.pdf');
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: const Text(
                                      'Download CV',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  GetInTouchContactsSheet(),
                                  const SizedBox(height: 8.0),
                                ],
                              ),
                              SizedBox(height: multiplier * 40),

                              const Text(
                                'I am a seasoned full stack developer with 2+ years of industry experience.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),

                              const Text(
                                'Currently working for a NewYork based startup Ventureseed as a Software Developer.\nI had worked as a Junior FullStack and OpenAi developer at Digia. Had done multiple projects for freelance clients. ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Always open for new challenges and startup project ideas.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              SizedBox(height: multiplier * 56),

                              // <------------------- About --------------------------- >
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height - 2 * 48,
                            // child: SvgPicture.asset(
                            //   'assets/images/personality_1.svg',
                            //   semanticsLabel: 'Personality',
                            //   fit: BoxFit.fitHeight,
                            // ),

                            child: const RiveAnimation.asset(
                              // 'assets/animations/college_student.riv',
                             ' assets/animations/pull_to_refresh.riv',
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
}
