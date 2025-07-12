import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.model.freezed.dart';

part 'experience.model.g.dart';

@freezed
abstract class ExperienceModel with _$ExperienceModel {
  const factory ExperienceModel({
    required String title,
    required String company,
    required String startDate,
    required String endDate,
    required String description,
    required String location,
    required List<String> technologies,
    required bool current,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);
}
