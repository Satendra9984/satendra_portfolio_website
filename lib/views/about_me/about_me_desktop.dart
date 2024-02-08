import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/views/widgets/status_bar.dart';

enum Skills {
  languages,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  skillsSection(),
                  databaseSection(),
                  frameworkSection(),
                  toolsSection(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stackTech(Skills skills, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
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

  Widget skillsSection() {
    double gap = 4.0;
    int basecolorindex = 0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stackTech(Skills.languages, 'Programming Languages'),
          StatusBarWidget(
            title: 'Python',
            years: 3,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'C++',
            years: 3,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Java',
            years: 2,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Dart',
            years: 2.5,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Rust',
            years: 0.5,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'GoLang',
            years: 0.5,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'HTML/CSS',
            years: 1,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
        ],
      ),
    );
  }

  Widget databaseSection() {
    double gap = 4.0;
    int basecolorindex = 7;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stackTech(Skills.databases, 'Databases'),
          StatusBarWidget(
            title: 'MongoDB',
            years: 2,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'PostgreSQL',
            years: 1,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'MySQL',
            years: 1,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Firebase',
            years: 2,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
        ],
      ),
    );
  }

  Widget frameworkSection() {
    double gap = 4.0;
    int basecolorindex = 11;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stackTech(Skills.frameworks, 'Frameworks'),
          StatusBarWidget(
            title: 'FastApi',
            years: 1,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Flutter',
            years: 3,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Node.js',
            years: 1,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          StatusBarWidget(
            title: 'Ajile',
            years: 1,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
        ],
      ),
    );
  }

  Widget toolsSection() {
    double gap = 4.0;
    int basecolorindex = 15;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stackTech(Skills.tools, 'Development Tools'),
          StatusBarWidget(
            title: 'Android Studio',
            years: 3,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Visual Studio ',
            years: 3,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Figma',
            years: 2,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          StatusBarWidget(
            title: 'Postman',
            years: 2,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Git/Github',
            years: 3,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
          SizedBox(height: gap),
          StatusBarWidget(
            title: 'Slack',
            years: 2,
            maxYears: 3,
            barColor:
                neumorphicColors[(basecolorindex++) % neumorphicColors.length]!,
          ),
        ],
      ),
    );
  }
}
