// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.links.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialLinksModel _$SocialLinksModelFromJson(Map<String, dynamic> json) =>
    _SocialLinksModel(
      github: json['github'] as String,
      linkedIn: json['linkedIn'] as String,
      twitter: json['twitter'] as String,
      instagram: json['instagram'] as String,
      facebook: json['facebook'] as String,
      medium: json['medium'] as String,
      email: json['email'] as String,
      resume: json['resume'] as String,
      discord: json['discord'] as String,
      phoneNumber: json['phoneNumber'] as String,
      hackerrank: json['hackerrank'] as String,
      leetcode: json['leetcode'] as String,
    );

Map<String, dynamic> _$SocialLinksModelToJson(_SocialLinksModel instance) =>
    <String, dynamic>{
      'github': instance.github,
      'linkedIn': instance.linkedIn,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'facebook': instance.facebook,
      'medium': instance.medium,
      'email': instance.email,
      'resume': instance.resume,
      'discord': instance.discord,
      'phoneNumber': instance.phoneNumber,
      'hackerrank': instance.hackerrank,
      'leetcode': instance.leetcode,
    };
