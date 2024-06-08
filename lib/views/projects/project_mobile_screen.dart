import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/models/project_data_model.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';
import 'package:personal_portfolio_website/views/projects/project_details_widget.dart';

class MyProjectsMobileScreen extends StatelessWidget {
  MyProjectsMobileScreen({super.key});

  final List<ProjectDataModel> _projects = [
    ProjectDataModel(
      title: 'Veridocs',
      descriptions: 'Automating Document verification',
      projectUrl: 'https://github.com/Satendra9984/veridox/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/veridox/blob/master/README.md',
      projectImageUrl: '',
    ),
    ProjectDataModel(
      title: 'FigmaJson, HTML/CSS to Digia Format',
      descriptions:
          'Figma JSON representations into a streamlined JSON format compatible with Digia Components',
      projectUrl: 'https://github.com/Satendra9984/figma_to_digiaJson/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/figma_to_digiaJson/blob/main/README.md',
      projectImageUrl: '',
    ),
    ProjectDataModel(
      title: 'FastApi Todo Full Stack ',
      descriptions:
          'This project provides a robust backend solution for managing todo tasks with CRUD operations and integrates JWT authentication for secure user access.',
      projectUrl: 'https://github.com/Satendra9984/fastapi_todo_backend/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/fastapi_todo_backend/blob/main/README.md',
      projectImageUrl: '',
    ),
    ProjectDataModel(
      title: 'Kanak-Metal Marketplace',
      descriptions:
          'marketplace designed for the seamless buying and selling of precious metals',
      projectUrl: 'https://github.com/Satendra9984/Kanak_Marketplace_App/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/Kanak_Marketplace_App/blob/main/README.md',
      projectImageUrl: '',
    ),
    // ProjectDataModel(
    //   title: '',
    //   descriptions: '',
    //   projectUrl:
    //       '',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int count = size.width ~/ 180;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          const Text(
            'Projects',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: AlignedGridView.count(
                crossAxisCount: count < 1 ? 1 : count,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: _projects.length,
                itemBuilder: (ctx, index) {
                  return projectTile(
                    context,
                    _projects[index],
                    index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget projectTile(BuildContext context, ProjectDataModel model, int index) {
    double offset = 1;
    double blurradius = 1.0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProjectDetailsMarkdownWidget(
              projectData: _projects[index],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
        alignment: Alignment.centerLeft,
        decoration: WidgetUtils.getBoxDecoration(
          offset: offset,
          blurRadius: blurradius,
          spreadRadius: 1,
          backgroundColor: Colors.grey.shade300,
          isDark: false,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: Image.network(
                model.projectImageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/images/projects_logo_cropped.png');
                },
              ),
            ),
            Text(
              model.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            Text(
              model.descriptions,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
