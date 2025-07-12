import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/configs/constant_strings.dart';
import 'package:http/http.dart' as http;

abstract class FetchService<T> {
  final String fileName;
  final T Function(Map<String, dynamic>) fromJson;

  FetchService(this.fileName, this.fromJson);

  Future<List<T>> fetchData() async {
    http.Response? response;
    try {
      final String dataUrl = '$assetGithubUrl$fileName.json';
      response = await http.get(Uri.parse(dataUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data as List).map((json) => fromJson(json)).toList();
      } else {
        log('Error fetching data: HTTP ${response.statusCode}');
        Get.snackbar(
          'Error',
          'Failed to load data: HTTP ${response.statusCode}\n${response.body}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        throw Exception('Failed to load data: HTTP ${response.statusCode}');
      }
    } catch (e, stack) {
      log('Exception in fetchAll: $e', stackTrace: stack);
      Get.snackbar(
        'Error',
        'Failed to fetch data from $fileName\nError: $e\n${response?.body ?? ''}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      rethrow;
    }
  }
}
