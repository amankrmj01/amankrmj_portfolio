import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amankrmj_portfolio/configs/constant_strings.dart';
import 'package:amankrmj_portfolio/domain/models/social_links.model.dart';

class SocialLinkService {
  static const String socialLinkUrl = '${assetGithubUrl}social_links.json';

  Future<SocialLinksModel> fetchAll() async {
    final response = await http.get(Uri.parse(socialLinkUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return SocialLinksModel.fromJson(data);
    } else {
      throw Exception('Failed to load social links');
    }
  }
}
