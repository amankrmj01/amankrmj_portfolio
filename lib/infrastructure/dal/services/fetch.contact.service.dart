import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/contact_details_model/contact.details.model.dart';

import '../../../configs/constant_strings.dart';

class FetchContactService {
  static const String _baseUrl = '${api}files/contacts';
  static const String passwordUrl = '${assetGithubUrl}password.json';

  Map<String, String> getAuthHeaders(String token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<String> fetchPassword() async {
    final response = await http.get(Uri.parse(passwordUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['password'] as String;
    } else {
      throw Exception('Failed to load password');
    }
  }

  Future<Map<String, String>> getAuthHeadersWithPassword(String string) async {
    final storedHash = await fetchPassword();
    final token = sha512.convert(utf8.encode("$storedHash$string")).toString();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<List<ContactDetailsModel>> fetchContacts({
    required String string,
  }) async {
    log('Fetching contacts from $_baseUrl', name: 'FetchContactService');
    try {
      final headers = await getAuthHeadersWithPassword(string);
      final response = await http.get(Uri.parse(_baseUrl), headers: headers);
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
        return data.map((json) => ContactDetailsModel.fromJson(json)).toList();
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
