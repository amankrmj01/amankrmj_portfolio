import '../../../domain/models/info.model.dart';

class CertificateInfo implements InfoModel {
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

  const CertificateInfo({
    required this.name,
    required this.description,
    required this.url,
    required this.images,
    required this.largeDescription,
  });
}
