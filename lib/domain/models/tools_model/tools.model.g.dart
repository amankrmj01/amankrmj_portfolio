// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToolsModel _$ToolsModelFromJson(Map<String, dynamic> json) => _ToolsModel(
  name: json['name'] as String,
  image: json['image'] as String,
  url: json['url'] as String,
  color: json['color'] as String,
  width: (json['width'] as num).toInt(),
);

Map<String, dynamic> _$ToolsModelToJson(_ToolsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'url': instance.url,
      'color': instance.color,
      'width': instance.width,
    };
