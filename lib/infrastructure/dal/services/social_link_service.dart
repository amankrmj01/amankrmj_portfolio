import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portfolio/configs/constant_strings.dart';
import 'package:portfolio/domain/models/social_links.model.dart';

class SocialLinkService {
  static const String socialLinkUrl = '${assetGithubUrl}social_links.json';

  Future<SocialLinksModel> fetchAll() async {
    try {
      final response = await http.get(Uri.parse(socialLinkUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return SocialLinksModel.fromJson(data);
      } else {
        throw Exception(
          'Failed to load social links: HTTP ${response.statusCode}',
        );
      }
    } catch (e) {
      // Optionally, log the error or handle it as needed
      throw Exception('Error fetching social links: $e');
    }
  }
}
