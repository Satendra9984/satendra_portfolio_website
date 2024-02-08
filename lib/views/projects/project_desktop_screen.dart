import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:personal_portfolio_website/core/network/http_utils.dart';
import 'package:personal_portfolio_website/models/project_data_model.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjectsDesktopScreen extends StatefulWidget {
  MyProjectsDesktopScreen({super.key});

  @override
  State<MyProjectsDesktopScreen> createState() =>
      _MyProjectsDesktopScreenState();
}

class _MyProjectsDesktopScreenState extends State<MyProjectsDesktopScreen> {
  int currentProject = 0;

  final List<ProjectDataModel> _projects = [
    ProjectDataModel(
      title: 'Veridocs',
      descriptions: 'Automating Document verification',
      projectUrl:
          'https://github.com/Satendra9984/veridox/blob/master/README.md',
    ),
    ProjectDataModel(
      title: 'FigmaJson, HTML/CSS to Digia Format',
      descriptions:
          'Figma JSON representations into a streamlined JSON format compatible with Digia Components',
      projectUrl:
          'https://github.com/Satendra9984/figma_to_digiaJson/blob/main/README.md',
    ),
    ProjectDataModel(
      title: 'FastApi Todo Full Stack ',
      descriptions:
          'This project provides a robust backend solution for managing todo tasks with CRUD operations and integrates JWT authentication for secure user access.',
      projectUrl:
          'https://github.com/Satendra9984/fastapi_todo_backend/blob/main/README.md',
    ),
    ProjectDataModel(
      title: 'Kanak-Metal Marketplace',
      descriptions:
          'marketplace designed for the seamless buying and selling of precious metals',
      projectUrl:
          'https://github.com/Satendra9984/Kanak_Marketplace_App/blob/main/README.md',
    ),
    // ProjectDataModel(
    //   title: '',
    //   descriptions: '',
    //   projectUrl:
    //       '',
    // ),
  ];

  Future<String?> _loadMarkdown(int index) async {
    String? mark = await HttpUtils.getReadmeMarkdownFormGithub(
      _projects[index].projectUrl,
    );
    // print(mark);
    return mark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Row(
        children: [
          // List
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: _projects.length,
                itemBuilder: (ctx, index) {
                  return projectTile(_projects[index], index);
                },
              ),
            ),
          ),
          // Detail
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 2),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              // decoration: BoxDecoration(
              //   color: Colors.grey.shade300,
              //   borderRadius: BorderRadius.circular(8),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.shade500,
              //       offset: const Offset(1, 1),
              //       blurRadius: 2,
              //       spreadRadius: 1,
              //     ),
              //     BoxShadow(
              //       color: Colors.white,
              //       offset: const Offset(-1, -1),
              //       blurRadius: 1,
              //       spreadRadius: 1,
              //     ),
              //   ],
              // ),
              child: FutureBuilder<String?>(
                future: _loadMarkdown(currentProject),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (snap.hasError ||
                      snap.hasData == false ||
                      snap.data == null) {
                    return const Center(
                      child: Icon(
                        Icons.error_outline_rounded,
                        color: Colors.redAccent,
                      ),
                    );
                  }
                  return Markdown(
                    data: snap.data!,
                    // onTapLink: (text, href, title) {
                    //   if (href != null) {
                    //     print(href);
                    //     // launchUrl(Uri(path: href));
                    //   }
                    // },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget projectTile(ProjectDataModel model, int index) {
    double offset = 1;
    double blurradius = 1.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentProject = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        alignment: Alignment.centerLeft,
        decoration: WidgetUtils.getBoxDecoration(
          offset: offset,
          blurRadius: blurradius,
          spreadRadius: 1,
          backgroundColor: Colors.grey.shade300,
          isDark: index == currentProject,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: index == currentProject
                    ? Colors.grey.shade100
                    : Colors.black,
                fontSize: 14.0,
              ),
            ),
            // const SizedBox(height: 5.0),
            Text(
              model.descriptions,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: index == currentProject
                    ? Colors.grey.shade300
                    : Colors.black,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
