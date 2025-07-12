// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.details.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactDetailsModel _$ContactDetailsModelFromJson(Map<String, dynamic> json) =>
    _ContactDetailsModel(
      name: json['name'] as String,
      countryCode: json['countryCode'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$ContactDetailsModelToJson(
  _ContactDetailsModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'countryCode': instance.countryCode,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
  'message': instance.message,
  'date': instance.date,
  'time': instance.time,
};
