import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/certificate.model.dart';
import 'abstract.service.dart';

class CertificateService extends AbstractService<CertificateModel> {
  static const String certificatesUrl = '${assetGithubUrl}certificates.json';

  @override
  Future<List<CertificateModel>> fetchAll() async {
    final response = await http.get(Uri.parse(certificatesUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => CertificateModel.fromJson(json)).toList();
    } else {
      // debugPrint(certificatesUrl);
      throw Exception('Failed to load certificates');
    }
  }
}
