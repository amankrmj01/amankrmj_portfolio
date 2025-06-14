import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import
import '../widgets/infinte.tilted.strip.dart';

class WorksController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  void onClose() {
    // TODO: implement onClose
    scrollController.dispose();
  }
}
