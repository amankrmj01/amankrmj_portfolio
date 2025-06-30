import 'dart:convert';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/domain/models/quote.model.dart';
import 'abstract.service.dart';

class QuoteService extends AbstractService<QuoteModel> {
  static const String quotesUrl = '${assetGithubUrl}quotes.json';

  @override
  Future<List<QuoteModel>> fetchAll() async {
    try {
      final response = await http.get(Uri.parse(quotesUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data.map((json) => QuoteModel.fromJson(json)).toList();
        } else {
          throw Exception('Invalid JSON format: expected a list');
        }
      } else {
        throw Exception('Failed to load quotes: HTTP [${response.statusCode}]');
      }
    } catch (e) {
      throw Exception('Error fetching quotes: $e');
    }
  }
}
