import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../../../configs/constant_strings.dart';

class AdminLoginService {
  static const String passwordUrl = '${assetGithubUrl}password.json';

  Future<bool> login(String username, String inputPassword) async {
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
        return false;
      }
    } finally {}
  }
}
