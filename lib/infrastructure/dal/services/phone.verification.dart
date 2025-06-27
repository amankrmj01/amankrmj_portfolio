import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../domain/models/phone.response.model.dart';
import 'abstract.verify.service.dart';

class PhoneValidator extends AbstractValidator<PhoneValidationResponse> {
  final String _apiKey = 'f04a16b9dbb54f179a4bcba2d83f3c8a';

  @override
  Future<PhoneValidationResponse> validate(String value) async {
    final url = Uri.parse(
      'https://phonevalidation.abstractapi.com/v1/?api_key=$_apiKey&phone=$value',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return PhoneValidationResponse.fromJson(data);
    } else {
      throw Exception('Failed to validate phone: ${response.statusCode}');
    }
  }
}
