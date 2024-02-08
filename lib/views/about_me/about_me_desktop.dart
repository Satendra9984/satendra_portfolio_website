import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';

class AboutMeDesktopScreen extends StatelessWidget {
  AboutMeDesktopScreen({super.key});

  final List<Color?> neumorphicColors = [
    Colors.blue, // Soft Blue
    Colors.green, // Light Green
    Colors.yellow, // Pale Yellow
    Colors.purple, // Lavender
    Colors.orange, // Peach
    Colors.cyan, // Light Aqua
    Colors.orangeAccent, // Pastel Orange
    Colors.greenAccent, // Mint Green
    Colors.pink, // Pale Pink
    Colors.grey, // Light Grey
    Colors.blue[300], // Lighter Blue
    Colors.orange[300], // Lighter Orange
    Colors.grey[700], // Dark Grey
    Colors.purple[300], // Dark Purple
    Colors.red[300], // Dark Red
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
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
                aboutMeSummary,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 24),

              // Skills
              // Languages
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  skillsSection(),
                  const SizedBox(height: 24),
                  skillsSection(),
                  const SizedBox(height: 24),
                  skillsSection(),
                ],
              ),
              // Framework/Technologies

              // Development Tools
            ],
          ),
        ),
      ),
    );
  }

  Widget skillsSection() {
    double gap = 12.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        statusBar(
          title: 'Python',
          years: 3,
          maxYears: 3,
          barColor: neumorphicColors[1]!,
        ),
        SizedBox(height: gap),
        statusBar(
          title: 'C++',
          years: 3,
          maxYears: 3,
          barColor: neumorphicColors[0]!,
        ),
        SizedBox(height: gap),
        statusBar(
          title: 'Java',
          years: 2,
          maxYears: 3,
          barColor: neumorphicColors[2]!,
        ),
        SizedBox(height: gap),
        statusBar(
          title: 'Dart',
          years: 2.5,
          maxYears: 3,
          barColor: neumorphicColors[3]!,
        ),
        SizedBox(height: gap),
        statusBar(
          title: 'Rust',
          years: 0.5,
          maxYears: 3,
          barColor: neumorphicColors[4]!,
        ),
        SizedBox(height: gap),
        statusBar(
          title: 'GoLang',
          years: 0.5,
          maxYears: 3,
          barColor: neumorphicColors[5]!,
        ),
        SizedBox(height: gap),
      ],
    );
  }

  Color randomColorIndex() {
    var rand = Random();
    int randomecolor = rand.nextInt(neumorphicColors.length);

    return neumorphicColors[randomecolor]!;
  }

  Widget statusBar({
    required String title,
    required double years,
    required double maxYears,
    required Color barColor,
  }) {
    double offset = 1.5;
    double blurRadius = 1;
    double spreadRadius = 1;

    double barWidth = (320 / maxYears) * years - 8.8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            '$title, $years years',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey.shade700,
              fontSize: 12.0,
            ),
          ),
        ),
        const SizedBox(height: 2.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.4, vertical: 4),
          width: 320,
          height: 22,
          decoration: WidgetUtils.getBoxDecoration(
            offset: offset + 0.5,
            blurRadius: blurRadius + 1,
            spreadRadius: spreadRadius + 1,
            borderRadius: 50.0,
            inset: true,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0.5),
                height: 18,
                width: barWidth,
                decoration: WidgetUtils.getBoxDecoration(
                  offset: offset - 0.5,
                  blurRadius: blurRadius,
                  spreadRadius: spreadRadius,
                  backgroundColor: barColor,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 20),
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        //   width: 180,
        //   height: 22,
        //   decoration: WidgetUtils.getBoxDecoration(
        //     offset: offset,
        //     blurRadius: blurRadius,
        //     spreadRadius: spreadRadius,
        //     borderRadius: 50.0,
        //     inset: true,
        //   ),
        //   child: Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.symmetric(vertical: 0.5),
        //         height: 18,
        //         width: 145,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(50.0),
        //           color: Colors.green,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }

  final String aboutMeSummary = """
Hey there! I'm Satendra Pal, a Junior Software Developer with a knack for crafting digital solutions. I'm well-versed in languages like C++, Java, and Dart, along with Flutter for Mobile and Web development. At Digia Technology Pvt. Limited, I've led the creation of exciting features, like the Figma UI Format to Digia Code, showcasing my prowess in both front and backend integration. With a keen eye for detail, I've applied SOLID principles rigorously, ensuring robust and scalable solutions. During my freelance stint at Reignsys Softech Pvt. Limited, I spearheaded the development of Veridocs-FieldVerif Systems, demonstrating my ability to architect and deliver complex applications. You'll find a plethora of projects in my portfolio, ranging from FastApi Todo FullStack App to Portfolio Website Template, reflecting my versatility and proficiency across various platforms. Armed with a B.Tech in Computer Science from IIIT Kalyani, I'm constantly honing my skills through resources like Udemy, YouTube, and Google. Let's connect and innovate together!
""";
}
