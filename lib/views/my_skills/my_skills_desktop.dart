import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/widgets/app_bar_tile.dart';
import 'package:personal_portfolio_website/views/widgets/status_bar.dart';

enum SkillName {
  progLanguages,
  databases,
  frameworks,
  tools,
}

class AboutMeDesktopScreen extends StatelessWidget {
  AboutMeDesktopScreen({super.key});

  final List<Color?> neumorphicColors = [
    Colors.blue[200], // Soft Blue
    Colors.green[200], // Light Green
    Colors.yellow[200], // Pale Yellow
    Colors.purple[200], // Lavender
    Colors.orange[200], // Peach
    Colors.cyan[200], // Light Aqua
    Colors.orangeAccent[100], // Pastel Orange
    Colors.greenAccent[100], // Mint Green
    Colors.pink[200], // Pale Pink
    Colors.grey[300], // Light Grey
    Colors.blue[100], // Lighter Blue
    Colors.orange[100], // Lighter Orange
    Colors.grey[700], // Dark Grey
    Colors.purple[300], // Dark Purple
    Colors.red[300], // Dark Red
    Color(0xFFf0f0f0),
    Color(0xFFc0c0c0),
    Color(0xFFa6c0fe),
    Color(0xFFa6febe),
    Color(0xFFfef7a6),
    Color(0xFFc0a6fe),
    Color(0xFFfec0e3),
    Color(0xFFfec0a6),
    Color(0xFFfe9e9e),
    Color(0xFFa6fefe),
  ];
  
  final List<StatusBarData> programmingLanguagesList = [
    StatusBarData(
      title: 'Python',
      years: 2,
    ),
    StatusBarData(
      title: 'C++',
      years: 2,
    ),
    StatusBarData(
      title: 'Java',
      years: 2,
    ),
    StatusBarData(
      title: 'Dart',
      years: 2.5,
    ),
    StatusBarData(
      title: 'Rust',
      years: 0.5,
    ),
    StatusBarData(
      title: 'GoLang',
      years: 0.5,
    ),
    StatusBarData(
      title: 'HTML/CSS',
      years: 1,
    ),
  ];

  final List<StatusBarData> databasesSkillsList = [
    StatusBarData(
      title: 'MongoDB',
      years: 2,
    ),
    StatusBarData(
      title: 'PostgreSQL',
      years: 1,
    ),
    StatusBarData(
      title: 'MySQL',
      years: 1,
    ),
    StatusBarData(
      title: 'Firebase',
      years: 2,
    ),
  ];

  final List<StatusBarData> frameworkList = [
    StatusBarData(
      title: 'FastApi',
      years: 1,
    ),
    StatusBarData(
      title: 'Flutter',
      years: 3,
    ),
    StatusBarData(
      title: 'Node.js',
      years: 1,
    ),
    StatusBarData(
      title: 'Ajile',
      years: 1,
    ),
  ];

  final List<StatusBarData> toolsList = [
    StatusBarData(
      title: 'Android Studio',
      years: 3,
    ),
    StatusBarData(
      title: 'Visual Studio ',
      years: 3,
    ),
    StatusBarData(
      title: 'Figma',
      years: 2,
    ),
    StatusBarData(
      title: 'Postman',
      years: 2,
    ),
    StatusBarData(
      title: 'Git/Github',
      years: 3,
    ),
    StatusBarData(
      title: 'Slack',
      years: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomRight,
            opacity: 0.70,
            image:
                AssetImage('assets/images/person_under_tree_cropped_side.png'),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.zero,
          child: Column(
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
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome To My World',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'About Me',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              fontSize: 32.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '''Hey there! I'm Satendra Pal, a Junior Software Developer with a knack for crafting digital solutions. I love facing technical challenges that no one is solving.
                            ''',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                              fontSize: 14.0,
                            ),
                          ),
                          //
                          Wrap(
                            runAlignment: WrapAlignment.spaceBetween,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              skillsDetailsSection(SkillName.progLanguages, 'Programming Languages'),
                              skillsDetailsSection(SkillName.databases, 'Databases'),
                              skillsDetailsSection(SkillName.frameworks, 'Frameworks'),
                              skillsDetailsSection(SkillName.tools, 'Developer Tools'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(''),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stackTech(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.grey.shade800,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget skillsDetailsSection(SkillName skillName, String title) {
    double gap = 2.0;
    int basecolorindex = 0;

    List<StatusBarData> barlist = [];

    if (skillName == SkillName.progLanguages) {
      barlist = programmingLanguagesList;
      basecolorindex = 0;
    } else if (skillName == SkillName.databases) {
      barlist = databasesSkillsList;
      basecolorindex = programmingLanguagesList.length;
    } else if (skillName == SkillName.frameworks) {
      barlist = frameworkList;
      basecolorindex = databasesSkillsList.length;
    } else if (skillName == SkillName.tools) {
      barlist = toolsList;
      basecolorindex = frameworkList.length;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stackTech(title),
          ...List.generate(
            barlist.length,
            (index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: gap),
                child: StatusBarWidget(
                  statusBarData: barlist[index],
                  barColor: neumorphicColors[
                      (basecolorindex++) % neumorphicColors.length]!,
                ),
              );
            },
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
