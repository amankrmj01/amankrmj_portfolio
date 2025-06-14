import '../../../domain/models/info.model.dart';

class ProjectInfoo implements InfoModel {
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

  const ProjectInfoo({
    required this.name,
    required this.description,
    required this.url,
    required this.images,
    required this.largeDescription,
    required this.type,
  });
}
