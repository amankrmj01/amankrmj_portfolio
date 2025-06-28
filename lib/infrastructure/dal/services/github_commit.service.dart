import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/github_commit.model.dart';
import 'package:portfolio/domain/models/contact_form.model.dart';

class GithubCommitService {
  final String token = '';

  GithubCommitService();

  Future<http.Response> createOrUpdateFile({
    required String path,
    required GithubCommitModel commit,
  }) async {
    final url = Uri.parse(
      'https://api.github.com/repos/amankrmj01/portfolio_asset/contents/contacts/$path',
    );
    final body = jsonEncode(commit.toJson());
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/vnd.github+json',
        'Content-Type': 'application/json',
      },
      body: body,
    );
    return response;
  }
}
