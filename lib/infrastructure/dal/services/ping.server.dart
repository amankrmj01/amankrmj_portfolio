import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../configs/constant_strings.dart';

class PingServerService {
  static const String _pingUrl = "${api}ping";
  final Logger _logger = Logger();

  Future<String> ping() async {
    final response = await http.get(Uri.parse(_pingUrl));
    try {
      if (response.statusCode == 200) {
        return 'true';
      } else {
        _logger.e('Request failed: ${response.body}');
        return 'false';
      }
    } catch (e, stackTrace) {
      _logger.e(
        'Exception occurred',
        error: e.toString(),
        stackTrace: stackTrace,
      );
      return 'false';
    }
  }
}
