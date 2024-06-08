import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/utils/colors.dart';
import 'package:personal_portfolio_website/views/get_in_touch/contacts_sheet.dart';
import 'package:personal_portfolio_website/views/widgets/neumorphic_buttons.dart';
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:url_launcher/url_launcher.dart';

import 'package:firebase_storage/firebase_storage.dart';

class PortfolioHomePageMobile extends StatelessWidget {
  const PortfolioHomePageMobile({super.key});
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

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
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
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 16,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // <------------------  Intro Part ---------------------->

                      const SizedBox(
                        height: 200.0,
                        child: RiveAnimation.asset(
                          //  'assets/animations/pull_to_refresh_.riv',
                          'assets/animations/bubble_demo.riv',
                          //  'assets/animations/college_student.riv',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // SizedBox(height: multiplier * 20),

                      Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          Text(
                            'I am',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: multiplier * 38,
                              fontWeight: FontWeight.w900,
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
                                fontSize: multiplier * 42,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            ' a ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: multiplier * 38,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (rect) {
                              return gradient.createShader(rect);
                            },
                            child: Text(
                              'Cross-Platform Engineer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: multiplier * 42,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            ' , ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: multiplier * 38,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (rect) {
                              return gradient.createShader(rect);
                            },
                            child: Text(
                              ' Enterpreneur ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: multiplier * 42,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            ' and an ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: multiplier * 38,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (rect) {
                              return gradient.createShader(rect);
                            },
                            child: Text(
                              'Innovator.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: multiplier * 42,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8.0),
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
                          const SizedBox(height: 16.0),
                          GetInTouchContactsSheet(),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'I am a seasoned full stack developer with 2+ years of industry experience.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),

                      const Text(
                        'Currently working for a NewYork based startup Ventureseed as a Software Developer.\nI had worked as a Junior FullStack and OpenAi developer at Digia. Had done multiple projects for freelance clients. ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Always open for new challenges and startup project ideas.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16.0),
                      // <------------------- About --------------------------- >
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
