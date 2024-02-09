import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/models/experience_data_model.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';

class MyExperienceDesktopScreen extends StatefulWidget {
  const MyExperienceDesktopScreen({super.key});

  @override
  State<MyExperienceDesktopScreen> createState() =>
      _MyExperienceDesktopScreenState();
}

class _MyExperienceDesktopScreenState extends State<MyExperienceDesktopScreen> {
  int currentExperienceSelected = -1;

  final List<ExperienceDataModel> _experiences = [
    ExperienceDataModel(
      role: 'Junior Software Engineer',
      company: 'Digia Softech',
      startDate: "9/2023",
      endDate: "2/2024",
      experience: '''
🚀 Led the end-to-end development of the Figma UI Format to Digia Code feature, overcoming challenges from requirement analysis to backend and frontend integration, showcasing leadership in feature development from scratch.

🔧 Reverse-engineered by customizing open-source key Flutter libraries IconSelector, GoogleFonts, showcasing adaptability and resourcefulness for tailored solutions.

🛠️ Applied S.O.L.I.D. principles rigorously, ensuring a robust, scalable, and enjoyable codebase, emphasizing a commitment to excellence.

🔄 Mastered Agile processes for innovation, providing a well-rounded perspective on project management and execution in the startup ecosystem.

💻 Flutter Mobile/Web, Typescript, Python, MongoDB, Postman, RESTFul APIs, Algorithm (Figma Parser), HTML/CSS, Figma, Git/Github, SOLID Principles, Flutter Bloc, State Management.
''',
    ),
    ExperienceDataModel(
      role: 'Software Engineer Intern',
      company: 'Lokal',
      startDate: "7/2023",
      endDate: "9/2024",
      experience: '''
⏱️ Unleashed my coding prowess by swiftly comprehending complex codebases in record time!

💡 Demonstrated remarkable efficiency in task delivery, consistently exceeding expectations with rapid and precise execution. 

🚀 Propelled project innovation by ingeniously suggesting and implementing a Dynamic Rendering Algorithm for widgets through the power of recursion, optimizing performance and user experience. 

📈 Recognized for exceptional contributions and promoted to master projects at DIGIA, showcasing leadership and technical prowess.

⏱️ Unleashed my coding prowess by swiftly comprehending complex codebases in record time!

💡 Demonstrated remarkable efficiency in task delivery, consistently exceeding expectations with rapid and precise execution. 

🚀 Propelled project innovation by ingeniously suggesting and implementing a Dynamic Rendering Algorithm for widgets through the power of recursion, optimizing performance and user experience. 

📈 Recognized for exceptional contributions and promoted to master projects at DIGIA, showcasing leadership and technical prowess.
💻 Skills: Flutter · Postman · Firebase · Dart · HTML5 · Creative Problem Solving
''',
    ),
    ExperienceDataModel(
      role: 'Freelancer',
      company: 'ReignSys Technologies',
      startDate: "1/2023",
      endDate: "7/2023",
      experience: '''
🚀 Crafted a complete mobile app from scratch, diving headfirst into the framework while on the learning curve! 

🎉 Fun-filled and incredibly enriching journey packed with hands-on experiences and valuable lessons. 

📝Nailed down every nuance of customer needs, meticulously documenting requirements to construct a robust system with minimal errors.

🚀 Crafted a complete mobile app from scratch, diving headfirst into the framework while on the learning curve! 🎉 Fun-filled and incredibly enriching journey packed with hands-on experiences and valuable lessons. 

📝Nailed down every nuance of customer needs, meticulously documenting requirements to construct a robust system with minimal errors.

💻 Skills: Flutter · Google Cloud Platform (GCP) · Node.js · Dart · Dynamic Programming · Creative Problem Solving · API Development · Flask''',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 44,vertical: 32.0),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Work Experiences',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 32.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // List of projects

                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _experiences.length,
                      itemBuilder: (context, index) {
                        return experienceTile(
                          _experiences[index],
                          index,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24),
                decoration:  const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    alignment: Alignment.bottomRight,
                    opacity: 0.70,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/2151038314.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget experienceTile(ExperienceDataModel model, int index) {
    double offset = 1;
    double blurradius = 1.0;
    return GestureDetector(
      onTap: () {
        if (currentExperienceSelected == index) {
          setState(() {
            currentExperienceSelected = -1;
          });
        } else {
          setState(() {
            currentExperienceSelected = index;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        alignment: Alignment.centerLeft,
        decoration: WidgetUtils.getBoxDecoration(
          offset: offset,
          blurRadius: blurradius,
          spreadRadius: 1,
          backgroundColor: Colors.grey.shade300,
          isDark: true,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    model.role,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade100,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Text(
                  '${model.startDate}-${model.endDate}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade100,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              '@ ${model.company}',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade100,
                fontSize: 14.0,
              ),
            ),
            if (currentExperienceSelected == index)
              Column(
                children: [
                  const SizedBox(height: 12.0),
                  Text(
                    model.experience,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade100,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
