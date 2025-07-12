import 'package:portfolio/infrastructure/dal/services/abstract.fetch.service.dart';

import '../../../domain/models/quote_model/quote.model.dart';

class QuotesFetchService extends FetchService<QuoteModel> {
  QuotesFetchService() : super('quotes', (json) => QuoteModel.fromJson(json));
}
