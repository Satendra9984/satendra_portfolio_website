import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_portfolio_website/utils/colors.dart';

class PortfolioHomePage extends StatefulWidget {
  PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final GlobalKey widgetKey = GlobalKey();

  final LinearGradient gradient = const LinearGradient(
    colors: [AppColours.orange, AppColours.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final LinearGradient orangeGradient = const LinearGradient(
    colors: [AppColours.orange, AppColours.orangeGradientSecondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  final LinearGradient blueGradient = const LinearGradient(
    colors: [AppColours.blueGradientLight, AppColours.blueGradientDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  void initState() {
    super.initState();
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          alignment: Alignment.center,
          child: SizedBox(
            width: 830,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // <------------------  Intro Part ---------------------->
                CircleAvatar(
                  radius: multiplier * 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return gradient.createShader(rect);
                        },
                        child: CircleAvatar(
                          radius: multiplier * 100,
                        ),
                      ),
                      Image.asset(
                        'assets/images/Avatar.png',
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: multiplier * 40),
                Text(
                  'I do code and',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: multiplier * 56,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    Text(
                      'make content ',
                      style: TextStyle(
                    color: Colors.black,
                        fontSize: multiplier * 56,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (rect) {
                        return gradient.createShader(rect);
                      },
                      child: Text(
                        'about it',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: multiplier * 56,
                          fontWeight: FontWeight.w800,
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
                    fontSize: multiplier * 18,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: multiplier * 56),

                // <------------------- About --------------------------- >
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: multiplier * 16,
                          horizontal: multiplier * 30,
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        'Get In Touch',
                        style: TextStyle(
                          color: AppColours.backgroundBlack,
                          fontSize: multiplier * 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: multiplier * 18),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: multiplier * 16,
                            horizontal: multiplier * 30),
                        backgroundColor: AppColours.backgroundBlack,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        'Download CV',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: multiplier * 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
