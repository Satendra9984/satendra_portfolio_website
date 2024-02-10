import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_portfolio_website/core/network/http_utils.dart';
import 'package:personal_portfolio_website/models/project_data_model.dart';
import 'package:personal_portfolio_website/utils/widget_utils.dart';
import 'package:personal_portfolio_website/views/app_bar_cubit/app_bar_cubit.dart';
import 'package:personal_portfolio_website/views/widgets/app_bar_tile.dart';
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
          'https://github.com/Satendra9984/veridox/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/veridox/blob/master/README.md',
    ),
    ProjectDataModel(
      title: 'FigmaJson, HTML/CSS to Digia Format',
      descriptions:
          'Figma JSON representations into a streamlined JSON format compatible with Digia Components',
      projectUrl:
          'https://github.com/Satendra9984/figma_to_digiaJson/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/figma_to_digiaJson/blob/main/README.md',
    ),
    ProjectDataModel(
      title: 'FastApi Todo Full Stack ',
      descriptions:
          'This project provides a robust backend solution for managing todo tasks with CRUD operations and integrates JWT authentication for secure user access.',
      projectUrl:
          'https://github.com/Satendra9984/fastapi_todo_backend/',
      projectReadmeUrl:
          'https://github.com/Satendra9984/fastapi_todo_backend/blob/main/README.md',
    ),
    ProjectDataModel(
      title: 'Kanak-Metal Marketplace',
      descriptions:
          'marketplace designed for the seamless buying and selling of precious metals',
      projectUrl:
          'https://github.com/Satendra9984/Kanak_Marketplace_App/',
      projectReadmeUrl:
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
      _projects[index].projectReadmeUrl,
    );
    // print(mark);
    return mark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: Row(
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
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 8, left: 24, right: 24, bottom: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            onTapLink: (text, href, title) {
                              if (href != null) {
                                // print(href);
                                launchUrl(Uri(path: href));
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/projects_logo_cropped.png'),
                ),
              ),
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
