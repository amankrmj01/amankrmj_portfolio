import 'package:get/get.dart';
import 'package:portfolio/infrastructure/dal/servicess/quotes.fetch.service.dart';

import '../../../domain/models/quote.model.dart';

class FooterController extends GetxController {
  final quotes = <QuoteModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    isLoading.value = true;
    try {
      final service = QuotesFetchService();
      final data = await service.fetchData();
      quotes.assignAll(data);
    } catch (e) {
      quotes.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
