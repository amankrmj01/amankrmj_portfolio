// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CertificateModel _$CertificateModelFromJson(
  Map<String, dynamic> json,
) => _CertificateModel(
  name: json['name'] as String,
  description: json['description'] as String,
  url: json['url'] as String,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  largeDescription: json['largeDescription'] as String,
  issuingOrganization: json['issuingOrganization'] as String,
  issueDate: json['issueDate'] as String,
  skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
  type: json['type'] as String,
);

Map<String, dynamic> _$CertificateModelToJson(_CertificateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'images': instance.images,
      'largeDescription': instance.largeDescription,
      'issuingOrganization': instance.issuingOrganization,
      'issueDate': instance.issueDate,
      'skills': instance.skills,
      'type': instance.type,
    };
