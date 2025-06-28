import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../../../configs/constant_strings.dart';

class AdminLoginService {
  static const String passwordUrl = '${assetGithubUrl}password.json';

  Future<bool> login(String username, String inputPassword) async {
    // Fetch the password file only when a new instance is used, and do not persist it
    final response = await http.get(Uri.parse(passwordUrl));
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String storedHash = data['password'];
        final String inputHash = sha512
            .convert(utf8.encode("${username}salt$inputPassword"))
            .toString();
        return inputHash == storedHash;
      } else {
        throw Exception('Failed to load password');
      }
    } finally {
      // Explicitly clear the response body and close the connection if possible
      // (http.get does not keep a file or stream open, so nothing to destroy)
      // If you were using a file or stream, you would close it here.
    }
  }
}
