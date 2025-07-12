import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.details.model.freezed.dart';

part 'contact.details.model.g.dart';

@freezed
abstract class ContactDetailsModel with _$ContactDetailsModel {
  const factory ContactDetailsModel({
    required String name,
    required String countryCode,
    required String phoneNumber,
    required String email,
    required String message,
    required String date,
    required String time,
  }) = _ContactDetailsModel;

  factory ContactDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsModelFromJson(json);
}
