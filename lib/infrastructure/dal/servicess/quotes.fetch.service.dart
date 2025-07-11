import 'package:portfolio/domain/models/quote.model.dart';
import 'package:portfolio/infrastructure/dal/servicess/abstract.fetch.service.dart';

class QuotesFetchService extends FetchService<QuoteModel> {
  QuotesFetchService() : super('quotes', (json) => QuoteModel.fromJson(json));
}
