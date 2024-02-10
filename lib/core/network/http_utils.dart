import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:personal_portfolio_website/core/dummy_data.dart';

class HttpUtils {
  static Future<String?> getReadmeMarkdownFormGithub(String url) async {
    String? markdown;

    // await http.get(Uri(path: url)).then((value) {
    //   if (value.statusCode != 200) {
    //     return;
    //   }

    //   if (value.statusCode == 200) {
    //     // print(value.body);
    //     markdown = value.body;
    //   }
    // }).onError((error, stackTrace) {
    //   // print(error);
    //   markdown = 'Some error Occured🚀';
    // });
    // markdown = markd;
    // print(markdown);
    
    return projectsReadmeDummyData[url];
  }
}


var markd = '';
