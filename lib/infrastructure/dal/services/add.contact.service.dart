import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/contact_form.model.dart';

class AddContactService {
  static const String _addContactUrl =
      'https://portfolio-backend-3nrj.onrender.com/api/v1/add/contact';

  Future<String> addContact(ContactFormModel contact) async {
    final response = await http.post(
      Uri.parse(_addContactUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(contact.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return 'true';
    } else {
      return response.body;
    }
  }
}
