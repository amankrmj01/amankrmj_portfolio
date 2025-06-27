import 'package:flutter_svg/svg.dart';
import 'package:portfolio/presentation/footer/views/contact_me_view.dart';
import 'package:portfolio/utils/k.showGeneralDialog.dart';
import 'package:portfolio/widgets/animated.navigate.button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../infrastructure/theme/colors.dart';
import '../../utils/launch.url.dart';
import 'controllers/footer.controller.dart';
import '../home/controllers/home.controller.dart';

class FooterScreen extends GetView<FooterController> {
  const FooterScreen({super.key});

  final Color _footerForegroundColor = const Color(0xFFC7D3B6);

  Widget _quoteSection() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.quotes.isEmpty) {
        return Center(
          child: Text(
            'No quotes available',
            style: TextStyle(color: _footerForegroundColor),
          ),
        );
      } else {
        final quotes = controller.quotes;
        final quote = (quotes.toList()..shuffle()).first;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AnimatedQuoteOnVisible(quote: quote),
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
      }
    });
  }

  Widget _footerWelcomePart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
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
          textAlign: TextAlign.center,
          maxLines: 2,
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
    final homeController = Get.find<HomeController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: 200,
          child: AnimatedNavigateButton(
            borderRadius: 16,
            label: "View Resume",
            onTap: () =>
                launchUrlExternal(homeController.socialLinks['resume'] ?? ''),
            icon: SvgPicture.asset(
              'assets/icons/resume.svg',
              width: 28,
              height: 28,
            ),
            width: 200,
          ),
        ),
        const SizedBox(height: 120),
        Container(
          alignment: Alignment.centerLeft,
          width: 200,
          child: Builder(
            builder: (context) => AnimatedNavigateButton(
              borderRadius: 16,
              label: "Contact Me",
              onTap: () {
                showBlurredGeneralDialog(
                  context: context,
                  builder: (context) => ContactMeView(),
                );
              },
              icon: Image.asset(
                'assets/icons/contact_me.png',
                width: 28,
                height: 28,
                fit: BoxFit.fitHeight,
              ),
              width: 200,
            ),
          ),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 1, child: _footerWelcomePart()),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [_madeWithFlutterLabel(), _ccLabel()],
                      ),
                    ),
                    Expanded(flex: 1, child: _footerSocial()),
                    // SizedBox(width: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedQuoteOnVisible extends StatefulWidget {
  final dynamic quote;

  const _AnimatedQuoteOnVisible({required this.quote});

  @override
  State<_AnimatedQuoteOnVisible> createState() =>
      _AnimatedQuoteOnVisibleState();
}

class _AnimatedQuoteOnVisibleState extends State<_AnimatedQuoteOnVisible> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    // Fallback: trigger after first frame in case already visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_visible) {
        setState(() {
          _visible = true;
        });
        debugPrint('Quote fallback: triggered after first frame');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(
        'animated-quote-visible-${widget.quote.hashCode}-${_visible ? 1 : 0}',
      ),
      onVisibilityChanged: (info) {
        debugPrint('Quote visibility: ${info.visibleFraction}');
        if (info.visibleFraction > 0 && !_visible) {
          setState(() {
            _visible = true;
          });
        } else if (info.visibleFraction == 0 && _visible) {
          // Reset _visible and also change the key to force ChimeBellText to fully rebuild next time
          setState(() {
            _visible = false;
          });
        }
      },
      child: _visible
          ? ChimeBellText(
              key: ValueKey(DateTime.now().millisecondsSinceEpoch),
              // force a new instance every time
              text: '"${widget.quote.quote}"',
              duration: const Duration(seconds: 4),
              type: AnimationType.word,
              textStyle: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                fontFamily: 'ShantellSans',
                color: KColor.secondarySecondColor,
              ),
            )
          : const SizedBox(height: 40),
    );
  }
}
