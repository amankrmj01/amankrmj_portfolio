import 'dart:developer';
import 'package:get/get.dart';

import '../../../../domain/models/about_me_info_model/about.me.info.model.dart';

import '../../../../domain/models/certificate_model/certificate.model.dart';
import '../../../../domain/models/experience_model/experience.model.dart';
import '../../../../domain/models/project_model/project.model.dart';
import '../../../../domain/models/quote_model/quote.model.dart';
import '../../../../domain/models/social_links_model/social.links.model.dart';
import '../../../../domain/models/tools_model/tools.model.dart';

import '../../../dal/services/about.me.info.fetch.service.dart';
import '../../../dal/services/certificates.fetch.service.dart';
import '../../../dal/services/experiences.info.fetch.service.dart';
import '../../../dal/services/projects.fetch.service.dart';
import '../../../dal/services/quotes.fetch.service.dart';
import '../../../dal/services/social.links.fetch.service.dart';
import '../../../dal/services/tools.fetch.service.dart';

// ignore: constant_identifier_names
enum Device { Desktop, Tablet, Mobile }

class InfoFetchController extends GetxController {
  final isQuotesLoading = true.obs;
  final isAboutMeInfoLoading = true.obs;
  final isExperienceLoading = true.obs;
  final isSocialLinksLoading = true.obs;
  final isCertificatesLoading = true.obs;
  final isProjectsLoading = true.obs;
  final isToolsLoading = true.obs;

  final quotes = <QuoteModel>[].obs;
  final aboutMeInfo = Rxn<AboutMeInfoModel>();
  final experiences = <ExperienceModel>[].obs;
  final socialLinks = Rxn<SocialLinksModel>();
  final certificates = <CertificateModel>[].obs;
  final projects = <ProjectModel>[].obs;
  final tools = <ToolsModel>[].obs;

  Future<void> fetchQuotes() async {
    isQuotesLoading.value = true;
    try {
      final service = QuotesFetchService();
      final data = await service.fetchData();
      quotes.assignAll(data);
    } catch (e) {
      log(
        'Error fetching quotes: \${e.toString()}',
        name: 'QuotesFetchService',
      );
      quotes.clear();
    } finally {
      isQuotesLoading.value = false;
    }
  }

  Future<void> fetchTools() async {
    isToolsLoading.value = true;
    try {
      final service = ToolsFetchService();
      final data = await service.fetchData();
      if (isClosed) return;
      tools.assignAll(data);
    } catch (e) {
      log('Error fetching tools: \${e.toString()}', name: 'ToolsFetchService');
      tools.clear();
    } finally {
      isToolsLoading.value = false;
    }
  }

  Future<void> fetchAboutMeInfo() async {
    isAboutMeInfoLoading.value = true;
    try {
      final service = AboutMeInfoFetchService();
      final links = await service.fetchData();
      if (isClosed) return;
      aboutMeInfo.value = links.first as AboutMeInfoModel?;
    } catch (e) {
      log(
        'Error fetching about me info: ${e.toString()}',
        name: 'AboutMeInfoFetchService',
      );
    } finally {
      isAboutMeInfoLoading.value = false;
    }
  }

  Future<void> fetchExperiences() async {
    isExperienceLoading.value = true;
    try {
      final service = ExperienceInfoFetchService();
      final data = await service.fetchData();
      if (isClosed) return;
      experiences.assignAll(data);
    } catch (e) {
      log(
        'Error fetching experiences: \\${e.toString()}',
        name: 'ExperienceInfoFetchService',
      );
      experiences.assignAll([]);
    } finally {
      isExperienceLoading.value = false;
    }
  }

  Future<void> fetchSocialLinks() async {
    isSocialLinksLoading.value = true;
    try {
      final service = SocialLinksFetchService();
      final links = await service.fetchData();
      if (isClosed) return;
      socialLinks.value = links.first;
    } catch (e) {
      log(
        'Error fetching social links: \${e.toString()}',
        name: 'SocialLinksFetchService',
      );
      socialLinks.value = SocialLinksModel(
        github: '',
        linkedIn: '',
        twitter: '',
        instagram: '',
        facebook: '',
        medium: '',
        email: '',
        resume: '',
        discord: '',
        phoneNumber: '',
        hackerrank: '',
        leetcode: '',
      );
    } finally {
      isSocialLinksLoading.value = false;
    }
  }

  Future<void> fetchCertificates() async {
    isCertificatesLoading.value = true;
    try {
      final service = CertificatesFetchService();
      final data = await service.fetchData();
      certificates.assignAll(data);
    } catch (e) {
      log(
        'Error fetching certificates: \${e.toString()}',
        name: 'CertificatesFetchService',
      );
      certificates.assignAll([]);
    } finally {
      isCertificatesLoading.value = false;
    }
  }

  Future<void> fetchProjects() async {
    isProjectsLoading.value = true;
    try {
      final service = ProjectsFetchService();
      final data = await service.fetchData();
      projects.assignAll(data);
    } catch (e) {
      log(
        'Error fetching projects: \${e.toString()}',
        name: 'ProjectsFetchService',
      );
      projects.assignAll([]);
    } finally {
      isProjectsLoading.value = false;
    }
  }

  final Rx<Device> currentDevice = Device.Desktop.obs;

  void updateDevice(double width) {
    if (width < 900) {
      currentDevice.value = Device.Mobile;
    } else if (width < 1300) {
      currentDevice.value = Device.Tablet;
    } else {
      currentDevice.value = Device.Desktop;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
    fetchAboutMeInfo();
    fetchTools();
    fetchExperiences();
    fetchSocialLinks();
    fetchCertificates();
    fetchProjects();
  }
}
