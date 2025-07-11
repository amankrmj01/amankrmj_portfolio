import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/contact_form.model.dart';

import '../../../configs/constant_strings.dart';

class AddContactService {
  static const String _addContactUrl = "${api}add/contact";

  Future<String> addContact(ContactFormModel contact) async {
    try {
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
    } catch (e) {
      return 'error: $e';
    }
  }
}
