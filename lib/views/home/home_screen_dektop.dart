import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/views/about_me/about_me_desktop.dart';
import 'package:personal_portfolio_website/views/experience/experience_desktop_screen.dart';
import 'package:personal_portfolio_website/views/home_screen.dart';
import 'package:personal_portfolio_website/views/projects/project_desktop_screen.dart';

class DesktopHomeScreen extends StatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  State<DesktopHomeScreen> createState() => _MyProjectsDesktopScreenState();
}

class _MyProjectsDesktopScreenState extends State<DesktopHomeScreen> {
  late final PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
        
      // ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 42.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'theWatcher',
                    style: GoogleFonts.play(    // play, playfair, pacifico, incosonata
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  getDrawer(),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // List
                  Expanded(
                    flex: 12,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        MyExperienceDesktopScreen(),
                        PortfolioHomePage(),
                        AboutMeDesktopScreen(),
                        MyProjectsDesktopScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row getDrawer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        navigationElement(
          iconData: Icons.home_rounded,
          title: 'Home',
          index: 0,
        ),
        navigationElement(
          iconData: Icons.person_2_rounded,
          title: 'About Me',
          index: 1,
        ),
        navigationElement(
          iconData: Icons.work_history_rounded,
          title: 'Experience',
          index: 2,
        ),
        navigationElement(
          iconData: Icons.code_rounded,
          title: 'Projects',
          index: 3,
        ),
      ],
    );
  }

  Widget navigationElement({
    required IconData iconData,
    required String title,
    required int index,
  }) {
    bool isCurrent = currentPage == index;
    double offset = 1.0;
    double blurradius = 1.0;
    return GestureDetector(
      onTap: () {
        _pageController.jumpToPage(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCurrent ? Colors.grey.shade900 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: isCurrent ? Colors.black : Colors.grey.shade500,
              offset: Offset(offset, offset),
              blurRadius: blurradius,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: isCurrent ? Colors.grey.shade100 : Colors.white,
              offset: Offset(-offset, -offset),
              blurRadius: blurradius,
              spreadRadius: 1,
            ),
          ],
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

        // ListTile(
        //   dense: true,
        //   selected: isCurrent,
        //   selectedTileColor: Colors.black,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),

        //   leading: Icon(
        //     iconData,
        //     color: isCurrent ? Colors.white : Colors.black,
        //     size: 16.0,
        //   ),
        // title: Text(
        //   title,
        //   style: TextStyle(
        //     fontWeight: FontWeight.w600,
        //     color: isCurrent ? Colors.white : Colors.black,
        //     fontSize: 14.0,
        //   ),
        // ),
        // ),
      ),
    );
  }
}
