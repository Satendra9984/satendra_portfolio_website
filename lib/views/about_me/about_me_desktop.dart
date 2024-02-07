import 'package:flutter/material.dart';

class AboutMeDesktopScreen extends StatelessWidget {
  const AboutMeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        alignment: Alignment.centerLeft,
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


           // Framework/Technologies


           // Development Tools
          
          ],
        ),
      ),
    );
  }

 final String aboutMeSummary = """
Hey there! I'm Satendra Pal, a Junior Software Developer with a knack for crafting digital solutions. I'm well-versed in languages like C++, Java, and Dart, along with Flutter for Mobile and Web development. At Digia Technology Pvt. Limited, I've led the creation of exciting features, like the Figma UI Format to Digia Code, showcasing my prowess in both front and backend integration. With a keen eye for detail, I've applied SOLID principles rigorously, ensuring robust and scalable solutions. During my freelance stint at Reignsys Softech Pvt. Limited, I spearheaded the development of Veridocs-FieldVerif Systems, demonstrating my ability to architect and deliver complex applications. You'll find a plethora of projects in my portfolio, ranging from FastApi Todo FullStack App to Portfolio Website Template, reflecting my versatility and proficiency across various platforms. Armed with a B.Tech in Computer Science from IIIT Kalyani, I'm constantly honing my skills through resources like Udemy, YouTube, and Google. Let's connect and innovate together!
""";

}
