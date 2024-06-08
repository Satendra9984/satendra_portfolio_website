import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:personal_portfolio_website/core/network/http_utils.dart';
import 'package:personal_portfolio_website/models/project_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsMarkdownWidget extends StatelessWidget {
  final ProjectDataModel projectData;
  const ProjectDetailsMarkdownWidget({required this.projectData, super.key});

  Future<String?> _loadMarkdown(String projectReadmeUrl) async {
    String? mark = await HttpUtils.getReadmeMarkdownFormGithub(
      projectReadmeUrl,
    );
    return mark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        margin: const EdgeInsets.only(top: 8, left: 24, right: 24, bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder<String?>(
          future: _loadMarkdown(projectData.projectReadmeUrl),
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
    );
  }
}
