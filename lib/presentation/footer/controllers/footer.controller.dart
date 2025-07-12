import 'package:get/get.dart';
import 'package:portfolio/infrastructure/navigation/bindings/controllers/info.fetch.controller.dart';

import '../../../domain/models/quote_model/quote.model.dart';

class FooterController extends GetxController {
  late var quotes = <QuoteModel>[].obs;
  late var isLoading = false.obs;
  final InfoFetchController infoFetchController =
      Get.find<InfoFetchController>();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = infoFetchController.isQuotesLoading.value;
    quotes.value = infoFetchController.quotes;
    ever(infoFetchController.isQuotesLoading, (val) {
      isLoading.value = val;
    });
    ever(infoFetchController.quotes, (val) {
      quotes.value = val;
    });
  }
}
