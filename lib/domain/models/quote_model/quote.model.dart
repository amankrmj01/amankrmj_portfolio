import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.model.freezed.dart';

part 'quote.model.g.dart';

@freezed
abstract class QuoteModel with _$QuoteModel {
  const factory QuoteModel({required String quote, required String author}) =
      _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
}
