import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/contact_form.model.dart';

import '../../../configs/constant_strings.dart';

class FetchContactService {
  static const String _baseUrl = '${api}files/contacts';

  Future<List<ContactFormModel>> fetchContacts() async {
    log('Fetching contacts from $_baseUrl', name: 'FetchContactService');
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      log(
        'Received response: ${response.statusCode}',
        name: 'FetchContactService',
      );
      if (response.statusCode == 200) {
        final body = response.body;
        if (body.isEmpty) {
          log('Response body is empty', name: 'FetchContactService');
          return [];
        }
        final List<dynamic>? data = json.decode(body);
        if (data == null) {
          log('Decoded data is null', name: 'FetchContactService');
          return [];
        }
        log(
          'Successfully fetched ${data.length} contacts',
          name: 'FetchContactService',
        );
        return data.map((json) => ContactFormModel.fromJson(json)).toList();
      } else {
        log(
          'Failed to load contacts: ${response.statusCode}',
          name: 'FetchContactService',
          level: 1000,
        );
        throw Exception('Failed to load contacts');
      }
    } catch (e, stack) {
      log(
        'Exception occurred: $e',
        name: 'FetchContactService',
        level: 1000,
        stackTrace: stack,
      );
      rethrow;
    }
  }
}
