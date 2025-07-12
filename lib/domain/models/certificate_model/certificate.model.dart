import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.model.freezed.dart';

part 'certificate.model.g.dart';

@freezed
abstract class CertificateModel with _$CertificateModel {
  const factory CertificateModel({
    required String name,
    required String description,
    required String url,
    required List<String> images,
    required String largeDescription,
    required String issuingOrganization,
    required String issueDate,
    required List<String> skills,
    required String type,
  }) = _CertificateModel;

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      _$CertificateModelFromJson(json);
}
