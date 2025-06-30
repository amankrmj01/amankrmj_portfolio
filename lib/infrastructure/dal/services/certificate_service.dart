import 'dart:convert';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/certificate.model.dart';
import 'abstract.service.dart';

class CertificateService extends AbstractService<CertificateModel> {
  static const String certificatesUrl = '${assetGithubUrl}certificates.json';

  @override
  Future<List<CertificateModel>> fetchAll() async {
    try {
      final response = await http.get(Uri.parse(certificatesUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data.map((json) => CertificateModel.fromJson(json)).toList();
        } else {
          throw Exception('Invalid JSON format: expected a list');
        }
      } else {
        throw Exception(
          'Failed to load certificates: HTTP ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching certificates: $e');
    }
  }
}
