import 'package:portfolio/infrastructure/dal/services/abstract.fetch.service.dart';

import '../../../domain/models/certificate_model/certificate.model.dart';

class CertificatesFetchService extends FetchService<CertificateModel> {
  CertificatesFetchService()
    : super('certificates', (json) => CertificateModel.fromJson(json));
}
