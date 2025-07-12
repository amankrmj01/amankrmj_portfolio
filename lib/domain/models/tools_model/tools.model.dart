import 'package:freezed_annotation/freezed_annotation.dart';

part 'tools.model.freezed.dart';

part 'tools.model.g.dart';

@freezed
abstract class ToolsModel with _$ToolsModel {
  const factory ToolsModel({
    required String name,
    required String image,
    required String url,
    required String color,
    required int width,
  }) = _ToolsModel;

  factory ToolsModel.fromJson(Map<String, dynamic> json) =>
      _$ToolsModelFromJson(json);
}
