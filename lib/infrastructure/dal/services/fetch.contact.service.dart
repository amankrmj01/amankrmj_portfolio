import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/contact_form.model.dart';

class FetchContactService {
  static const String _baseUrl =
      'https://portfolio-backend-3nrj.onrender.com/api/v1/files/contacts';

  Future<List<ContactFormModel>> fetchContacts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ContactFormModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load contacts');
    }
  }
}
