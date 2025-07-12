import 'package:freezed_annotation/freezed_annotation.dart';

part 'about.me.info.model.freezed.dart';

part 'about.me.info.model.g.dart';

@freezed
abstract class AboutMeInfoModel with _$AboutMeInfoModel {
  const factory AboutMeInfoModel({
    required String name,
    required String profession,
    required String location,
    required List<String> interests,
    required String experience,
    required String education,
    required String email,
    required String summary,
    required List<String> technicalInterests,
  }) = _AboutMeInfoModel;

  factory AboutMeInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AboutMeInfoModelFromJson(json);
}
