import 'package:get/get.dart';

import '../../../domain/models/quote.model.dart';
import '../../../infrastructure/dal/services/quote_service.dart';

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
      final service = Get.find<QuoteService>();
      final data = await service.fetchAll();
      quotes.assignAll(data);
    } catch (e) {
      quotes.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
