import 'package:amankrmj_portfolio/infrastructure/dal/daos/certificate.info.dart';

final List<CertificateInfo> certificateList = [
  CertificateInfo(
    name: 'Flutter Development Bootcamp with Dart',
    description: 'Learn Flutter and Dart to build iOS and Android apps',
    url: 'https://www.udemy.com/certificate/UC-1234567890/',
    screenshots: ['https://example.com/flutter_certificate.png'],
    largeDescription:
        'This course covers the fundamentals of Flutter development using Dart.',
  ),
  CertificateInfo(
    name: 'Advanced Flutter Development',
    description:
        'Deep dive into advanced Flutter concepts and state management',
    url: 'https://www.udemy.com/certificate/UC-0987654321/',
    screenshots: ['https://example.com/advanced_flutter_certificate.png'],
    largeDescription:
        'This course focuses on advanced topics in Flutter, including state management and performance optimization.',
  ),
];
