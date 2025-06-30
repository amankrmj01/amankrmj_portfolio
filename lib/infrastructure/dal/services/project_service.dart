import 'dart:convert';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/project.model.dart';
import 'abstract.service.dart';

class ProjectService extends AbstractService<ProjectModel> {
  static const String projectsUrl = '${assetGithubUrl}projects.json';

  @override
  Future<List<ProjectModel>> fetchAll() async {
    try {
      final response = await http.get(Uri.parse(projectsUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data.map((json) => ProjectModel.fromJson(json)).toList();
        } else {
          throw Exception('Invalid JSON format: expected a list');
        }
      } else {
        throw Exception('Failed to load projects: HTTP ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching projects: $e');
    }
  }
}
