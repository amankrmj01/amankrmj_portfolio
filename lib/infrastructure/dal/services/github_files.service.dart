import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/models/contact_form.model.dart';

class GithubFilesService {
  final String token = String.fromEnvironment('PORTFOLIO_READ_WRITE');

  Future<List<Map<String, dynamic>>> getFilesInContacts() async {
    final url = Uri.parse(
      'https://api.github.com/repos/amankrmj01/portfolio_asset/contents/contacts/',
    );
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/vnd.github+json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      // Use printContactFiles to fetch file contents
      return await printContactFiles(
        jsonResponse.map((file) => file as Map<String, dynamic>).toList(),
      );
    } else {
      throw Exception('Failed to fetch files: \\${response.statusCode}');
    }
  }

  Future<List<Map<String, dynamic>>> printContactFiles(
    List<Map<String, dynamic>> files,
  ) async {
    List<Map<String, dynamic>> result = [];
    for (final file in files) {
      final apiUrl = file['url']; // Use the GitHub API URL for the file
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/vnd.github+json',
        },
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final contentBase64 = json['content'];
        final decodedContent = utf8.decode(
          base64.decode(contentBase64.replaceAll('\n', '')),
        );
        // Parse the decoded content as JSON and use ContactFormModel
        final contact = ContactFormModel.fromJson(jsonDecode(decodedContent));
        // Extract date and time from the filename
        final fileName = file['path'].split('/').last;
        final regex = RegExp(r'contact(\d{8})_(\d{6})');
        final match = regex.firstMatch(fileName);
        String? date;
        String? time;
        if (match != null) {
          date = match.group(1); // YYYYMMDD
          time = match.group(2); // HHMMSS
        }
        result.add({
          'path': file['path'],
          'content': contact.toJson(),
          'status': response.statusCode,
          'date': date,
          'time': time,
        });
      } else {
        result.add({
          'path': file['path'],
          'content': null,
          'status': response.statusCode,
          'date': null,
          'time': null,
        });
      }
    }
    return result;
  }
}
