import 'package:freezed_annotation/freezed_annotation.dart';

part 'social.links.model.freezed.dart';

part 'social.links.model.g.dart';

@freezed
abstract class SocialLinksModel with _$SocialLinksModel {
  const factory SocialLinksModel({
    required String github,
    required String linkedIn,
    required String twitter,
    required String instagram,
    required String facebook,
    required String medium,
    required String email,
    required String resume,
    required String discord,
    required String phoneNumber,
    required String hackerrank,
    required String leetcode,
  }) = _SocialLinksModel;

  factory SocialLinksModel.fromJson(Map<String, dynamic> json) =>
      _$SocialLinksModelFromJson(json);
}
