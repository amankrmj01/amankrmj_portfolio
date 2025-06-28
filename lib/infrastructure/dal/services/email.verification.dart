import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../domain/models/email.respoonse.model.dart';
import 'abstract.verify.service.dart';

class EmailValidator extends AbstractValidator<EmailValidationResponse> {
  final String _apiKey = String.fromEnvironment('ABSTRACT_EMAIL');

  @override
  Future<EmailValidationResponse> validate(String value) async {
    final url = Uri.parse(
      'https://emailvalidation.abstractapi.com/v1/?api_key=$_apiKey&email=$value',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return EmailValidationResponse.fromJson(data);
    } else {
      throw Exception('Failed to validate email: \\${response.statusCode}');
    }
  }
}
