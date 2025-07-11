import 'package:get/get.dart';
import 'package:portfolio/domain/models/certificate.model.dart';
import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/domain/models/quote.model.dart';
import 'package:portfolio/infrastructure/dal/servicess/certificates.fetch.service.dart';
import 'package:portfolio/infrastructure/dal/servicess/projects.fetch.service.dart';
import 'dart:developer';

import '../../../../domain/models/about.me.info.model.dart';
import '../../../../domain/models/experience.model.dart';
import '../../../../domain/models/social_links.model.dart';
import '../../../dal/servicess/about.me.info.fetch.service.dart';
import '../../../dal/servicess/experiences.info.fetch.service.dart';
import '../../../dal/servicess/quotes.fetch.service.dart';
import '../../../dal/servicess/social.links.fetch.service.dart';

// ignore: constant_identifier_names
enum Device { Desktop, Tablet, Mobile }

class InfoFetchController extends GetxController {
  final isQuotesLoading = true.obs;
  final isAboutMeInfoLoading = true.obs;
  final isExperienceLoading = true.obs;
  final isSocialLinksLoading = true.obs;
  final isCertificatesLoading = true.obs;
  final isProjectsLoading = true.obs;

  final quotes = <QuoteModel>[].obs;
  final aboutMeInfo = Rxn<AboutMeInfoModel>();
  final experiences = <ExperienceModel>[].obs;
  final socialLinks = Rxn<SocialLinksModel>();
  final certificates = <CertificateModel>[].obs;
  final projects = <ProjectModel>[].obs;

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

  Future<void> fetchAboutMeInfo() async {
    isAboutMeInfoLoading.value = true;
    try {
      final service = AboutMeInfoFetchService();
      final List<dynamic> links = await service.fetchData();
      if (isClosed) return;

      aboutMeInfo.value = links.first;
      isAboutMeInfoLoading.value = false;
      log(
        'Successfully fetched about me info: \\${aboutMeInfo.value?.toJson()}',
        name: 'AboutMeInfoFetchService',
      );
    } catch (e) {
      log(
        'Error fetching about me info: \${e.toString()}',
        name: 'AboutMeInfoFetchService',
      );
      aboutMeInfo.value = AboutMeInfoModel(
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
    }
  }

  Future<void> fetchExperiences() async {
    isExperienceLoading.value = true;
    try {
      final service = ExperienceInfoFetchService();
      final data = await service.fetchData();
      experiences.assignAll(data);
      log(
        'Successfully fetched experiences: \\${data.toString()}',
        name: 'ExperienceInfoFetchService',
      );
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
    fetchExperiences();
    fetchSocialLinks();
    fetchCertificates();
    fetchProjects();
  }
}
