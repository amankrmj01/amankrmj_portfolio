// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    _ExperienceModel(
      title: json['title'] as String,
      company: json['company'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      current: json['current'] as bool,
    );

Map<String, dynamic> _$ExperienceModelToJson(_ExperienceModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'company': instance.company,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'location': instance.location,
      'technologies': instance.technologies,
      'current': instance.current,
    };
