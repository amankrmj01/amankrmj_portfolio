import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amankrmj_portfolio/domain/models/projects_info.dart';
import 'abstract.service.dart';

class ProjectService extends AbstractService<ProjectInfo> {
  static const String projectsUrl =
      'https://raw.githubusercontent.com/amankrmj01/amankrmj01/main/.github/projects.json';

  @override
  Future<List<ProjectInfo>> fetchAll() async {
    final response = await http.get(Uri.parse(projectsUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ProjectInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
