import 'package:portfolio/infrastructure/dal/servicess/abstract.fetch.service.dart';

import '../../../domain/models/certificate.model.dart';

class CertificatesFetchService extends FetchService<CertificateModel> {
  CertificatesFetchService()
    : super('certificates', (json) => CertificateModel.fromJson(json));
}
