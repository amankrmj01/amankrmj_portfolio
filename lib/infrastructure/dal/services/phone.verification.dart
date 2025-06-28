import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../domain/models/phone.response.model.dart';
import 'abstract.verify.service.dart';

class PhoneValidator extends AbstractValidator<PhoneValidationResponse> {
  final Logger _logger = Logger();
  final String _apiKey = kReleaseMode
      ? const String.fromEnvironment('ABSTRACT_PHONE', defaultValue: '')
      : (dotenv.env['ABSTRACT_PHONE'] ?? '');

  @override
  Future<PhoneValidationResponse> validate(String value) async {
    final url = Uri.parse(
      'https://phonevalidation.abstractapi.com/v1/?api_key=$_apiKey&phone=$value',
    );
    if (_apiKey.isEmpty) {
      _logger.e('ABSTRACT_PHONE token is not set.');
      throw Exception('ABSTRACT_PHONE token is not set.');
    }
    final response = await http.get(url);
    if (response.statusCode == 200) {
      _logger.i('Phone validated successfully.');
      final data = json.decode(response.body) as Map<String, dynamic>;
      return PhoneValidationResponse.fromJson(data);
    } else {
      _logger.e('Failed to validate phone: \\${response.statusCode}');
      throw Exception('Failed to validate phone: \\${response.statusCode}');
    }
  }
}
