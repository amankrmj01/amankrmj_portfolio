import 'info.model.dart';

class ProjectInfo implements InfoModel {
  @override
  final String name;
  @override
  final String description;
  @override
  final String url;
  @override
  final List<String> screenshots;
  @override
  final String largeDescription;

  const ProjectInfo({
    required this.name,
    required this.description,
    required this.url,
    required this.screenshots,
    required this.largeDescription,
  });
}
