import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

import '../../../domain/models/email.respoonse.model.dart';
import 'abstract.verify.service.dart';

class EmailValidator extends AbstractValidator<EmailValidationResponse> {
  final Logger _logger = Logger();
  final String _apiKey = kReleaseMode
      ? const String.fromEnvironment('ABSTRACT_EMAIL', defaultValue: '')
      : (dotenv.env['ABSTRACT_EMAIL'] ?? '');

  @override
  Future<EmailValidationResponse> validate(String value) async {
    final url = Uri.parse(
      'https://emailvalidation.abstractapi.com/v1/?api_key=$_apiKey&email=$value',
    );
    if (_apiKey.isEmpty) {
      _logger.e('ABSTRACT_EMAIL token is not set.');
      throw Exception('ABSTRACT_EMAIL token is not set.');
    }

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return EmailValidationResponse.fromJson(data);
    } else {
      _logger.e('Failed to validate email: \\${response.statusCode}');
      throw Exception('Failed to validate email: \\${response.statusCode}');
    }
  }
}
