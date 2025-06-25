import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/project.model.dart';
import 'abstract.service.dart';

class ProjectService extends AbstractService<ProjectModel> {
  static const String projectsUrl = '${assetGithubUrl}projects.json';

  @override
  Future<List<ProjectModel>> fetchAll() async {
    final response = await http.get(Uri.parse(projectsUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ProjectModel.fromJson(json)).toList();
    } else {
      // debugPrint(projectsUrl);
      throw Exception('Failed to load projects');
    }
  }
}
