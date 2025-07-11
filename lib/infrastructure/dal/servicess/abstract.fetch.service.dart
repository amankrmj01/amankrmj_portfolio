import 'dart:convert';
import 'dart:developer';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;

abstract class FetchService<T> {
  final String fileName;
  final T Function(Map<String, dynamic>) fromJson;

  FetchService(this.fileName, this.fromJson);

  Future<List<T>> fetchData() async {
    try {
      final String dataUrl = '$assetGithubUrl$fileName.json';
      final response = await http.get(Uri.parse(dataUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data as List).map((json) => fromJson(json)).toList();
      } else {
        log('Error fetching data: HTTP ${response.statusCode}');
        throw Exception('Failed to load data: HTTP ${response.statusCode}');
      }
    } catch (e, stack) {
      log('Exception in fetchAll: $e', stackTrace: stack);
      rethrow;
    }
  }
}
