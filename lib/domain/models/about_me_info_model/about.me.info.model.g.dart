// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.me.info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AboutMeInfoModel _$AboutMeInfoModelFromJson(Map<String, dynamic> json) =>
    _AboutMeInfoModel(
      name: json['name'] as String,
      profession: json['profession'] as String,
      location: json['location'] as String,
      interests: (json['interests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      experience: json['experience'] as String,
      education: json['education'] as String,
      email: json['email'] as String,
      summary: json['summary'] as String,
      technicalInterests: (json['technicalInterests'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutMeInfoModelToJson(_AboutMeInfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profession': instance.profession,
      'location': instance.location,
      'interests': instance.interests,
      'experience': instance.experience,
      'education': instance.education,
      'email': instance.email,
      'summary': instance.summary,
      'technicalInterests': instance.technicalInterests,
    };
