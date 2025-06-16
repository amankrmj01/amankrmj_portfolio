import 'package:amankrmj_portfolio/configs/constant_strings.dart';
import 'package:amankrmj_portfolio/widgets/animated.navigate.button.dart';
import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../domain/models/quote.model.dart';
import '../../infrastructure/theme/colors.dart';
import '../../utils/launch.url.dart';
import 'controllers/footer.controller.dart';

class FooterScreen extends GetView<FooterController> {
  const FooterScreen({super.key});

  final Color _footerForegroundColor = const Color(0xFFC7D3B6);

  Widget _quoteSection() {
    return FutureBuilder<List<QuoteModel>>(
      future: controller.fetchQuotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Failed to load quote',
              style: TextStyle(color: _footerForegroundColor),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No quotes available',
              style: TextStyle(color: _footerForegroundColor),
            ),
          );
        }
        final quotes = snapshot.data!;
        final quote = (quotes..shuffle()).first;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '"${quote.quote}"',
              textAlign: TextAlign.center,
              maxLines: 5,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: 'ShantellSans',
                color: KColor.secondarySecondColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  '— ${quote.author}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(width: 60),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _footerWelcomePart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Let's work together!",
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            color: _footerForegroundColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'ShantellSans',
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "I'm available for Freelancing",
          style: TextStyle(
            color: _footerForegroundColor,
            fontSize: 32,
            fontWeight: FontWeight.w400,
            fontFamily: 'ShantellSans',
          ),
        ),
      ],
    );
  }

  Widget _footerSocial() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 120,
          child: AnimatedNavigateButton(
            label: "Resume",
            onTap: () => launchUrlExternal(resumeUrl),
            icon: Icons.cloud_download,
          ),
        ),
        const SizedBox(height: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "- Contact Info",
              style: TextStyle(
                color: _footerForegroundColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Atlas.inbox_mailbox,
                  color: _footerForegroundColor,
                  size: 18.0,
                ),
                const SizedBox(width: 14),
                Text(
                  'amankrmj@outlook.com',
                  style: TextStyle(
                    color: _footerForegroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Atlas.phonebook,
                  color: _footerForegroundColor,
                  size: 18.0,
                ),
                const SizedBox(width: 14),
                Text(
                  'xxxxxxxxxxx',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _madeWithFlutterLabel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Build using ',
          style: TextStyle(
            color: _footerForegroundColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const FlutterLogo(size: 18),
        Text(
          ' with much ',
          style: TextStyle(
            color: _footerForegroundColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Icon(Icons.favorite, color: Colors.red),
      ],
    );
  }

  Widget _ccLabel() {
    return Text(
      '©️ 2025 Aman Kumar',
      style: TextStyle(
        color: _footerForegroundColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height > 776 ? Get.height : 776,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(flex: 6, child: _quoteSection()),
          Expanded(
            flex: 4,
            child: ColoredBox(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _footerWelcomePart()),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [_madeWithFlutterLabel(), _ccLabel()],
                    ),
                  ),
                  Expanded(child: _footerSocial()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
