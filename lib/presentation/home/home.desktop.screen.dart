import 'package:amankrmj_portfolio/presentation/home/views/home_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // HomeBarView(),
          Align(alignment: Alignment.topCenter, child: HomeBarView()),
          const Center(
            child: Text(
              'HomeScreen is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
