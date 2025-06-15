import 'package:get/get.dart';

import '../../../domain/models/quote.model.dart';
import '../../../infrastructure/dal/services/quote_service.dart';

class FooterController extends GetxController {
  Future<List<QuoteModel>> fetchQuotes() async {
    final service = Get.find<QuoteService>();
    return await service.fetchAll();
  }
}
