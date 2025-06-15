import 'info.model.dart';

class ProjectModel implements InfoModel {
  @override
  final String name;
  @override
  final String description;
  @override
  final String url;
  @override
  final List<String> images;
  @override
  final String largeDescription;

  @override
  final String type;

  ProjectModel({
    required this.name,
    required this.description,
    required this.url,
    required this.images,
    required this.largeDescription,
    required this.type,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      images: List<String>.from(json['images'] as List),
      largeDescription: json['largeDescription'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'url': url,
      'images': images,
      'largeDescription': largeDescription,
      'type': type,
    };
  }
}
