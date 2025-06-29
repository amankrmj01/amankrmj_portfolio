import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class PingServerService {
  static const String _pingUrl =
      'https://portfolio-backend-3nrj.onrender.com/api/v1/ping';
  final Logger _logger = Logger();

  Future<String> ping() async {
    final response = await http.get(Uri.parse(_pingUrl));
    try {
      if (response.statusCode == 200) {
        return 'true';
      } else {
        _logger.e('Request failed: ${response.body}');
        throw Exception(response.body);
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Exception occurred',
        error: e.toString(),
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
