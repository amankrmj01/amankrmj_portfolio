import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/github_commit.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

class GithubCommitService {
  final Logger _logger = Logger();
  final String token = kReleaseMode
      ? const String.fromEnvironment('PORTFOLIO_READ_WRITE', defaultValue: '')
      : (dotenv.env['PORTFOLIO_READ_WRITE'] ?? '');

  GithubCommitService();

  bool get hasToken => token.isNotEmpty;

  Future<http.Response> createOrUpdateFile({
    required String path,
    required GithubCommitModel commit,
  }) async {
    final url = Uri.parse(
      'https://api.github.com/repos/amankrmj01/portfolio_asset/contents/contacts/$path',
    );
    if (!hasToken) {
      _logger.e('GitHub token is not set.');
      throw Exception('GitHub token is not set.');
    }
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
