import 'package:http/http.dart' as http;

import '../../../configs/constant_strings.dart';

class PingServerService {
  static const String _pingUrl = "${api}ping";

  Future<String> ping() async {
    try {
      final response = await http.get(Uri.parse(_pingUrl));
      if (response.statusCode == 200) {
        return 'true';
      } else {
        return 'false';
      }
    } catch (e) {
      return 'false';
    }
  }
}
