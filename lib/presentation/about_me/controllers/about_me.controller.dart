import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/domain/models/about.me.info.model.dart';

import '../../../infrastructure/dal/servicess/about.me.info.fetch.service.dart';

class AboutMeController extends GetxController {
  final Rxn<AboutMeInfoModel> aboutMeInfo = Rxn<AboutMeInfoModel>();
  final isLoading = true.obs;

  final Logger _logger = Logger();

  Future<void> fetchAboutMeInfo() async {
    try {
      final service = AboutMeInfoFetchService();
      final List<dynamic> links = await service.fetchData();
      if (isClosed) return;
      aboutMeInfo.value = (links.isNotEmpty && links.first != null)
          ? links.first
          : AboutMeInfoModel(
              name: '',
              profession: '',
              location: '',
              interests: [],
              experience: '',
              education: '',
              email: '',
              summary: '',
              technicalInterests: [],
              tools: [],
            );
      isLoading.value = false;
    } catch (e) {
      isLoading.value = true;
      _logger.e('Error fetching social links', error: e);
      if (isClosed) return;
      aboutMeInfo.value = null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAboutMeInfo();
  }
}
