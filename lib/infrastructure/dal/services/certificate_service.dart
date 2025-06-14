import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amankrmj_portfolio/domain/models/certificate_info.dart';
import 'abstract.service.dart';

class CertificateService extends AbstractService<CertificateInfo> {
  static const String certificatesUrl =
      'https://raw.githubusercontent.com/amankrmj01/amankrmj01/main/.github/certificates.json';

  @override
  Future<List<CertificateInfo>> fetchAll() async {
    final response = await http.get(Uri.parse(certificatesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CertificateInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load certificates');
    }
  }
}
