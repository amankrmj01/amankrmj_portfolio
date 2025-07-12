// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => _QuoteModel(
  quote: json['quote'] as String,
  author: json['author'] as String,
);

Map<String, dynamic> _$QuoteModelToJson(_QuoteModel instance) =>
    <String, dynamic>{'quote': instance.quote, 'author': instance.author};
