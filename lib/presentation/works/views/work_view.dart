import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/infrastructure/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/k.infinite.scroll.image.dart';
import '../controllers/works.controller.dart';

class WorkView extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback? onClose;

  const WorkView({super.key, required this.project, this.onClose});

  @override
  State<WorkView> createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  final controller = Get.find<WorksController>();

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.project.type == 'mobile';

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Material(
          color: Colors.transparent,
          child: Container(
            height:
                (MediaQuery.of(context).size.height > 776
                    ? MediaQuery.of(context).size.height
                    : 776) -
                80,
            decoration: BoxDecoration(
              color: Color.lerp(Color(0xFF23304A), Colors.transparent, 0.06)!,
              borderRadius: BorderRadius.circular(24),
            ),
            child: isMobile
                ? Column(
                    children: [
                      _buildAppBar(context),
                      const Divider(height: 1),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: SingleChildScrollView(
                                  child: _buildContent(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: double.infinity,
                                child: KInfiniteScrollImage(
                                  images: widget.project.images,
                                  height: 600,
                                  imageWidth: 400,
                                  direction: "vertical",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildAppBar(context),
                      const Divider(height: 1),
                      Flexible(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildImageSection(),
                              const SizedBox(height: 24),
                              _buildContent(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildTitle(),
        const SizedBox(height: 12),
        Text(
          widget.project.description,
          style: TextStyle(
            fontSize: 28,
            color: KColor.primarySecondColor,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(height: 16),
        Text(
          widget.project.largeDescription,
          style: TextStyle(
            fontSize: 20,
            color: KColor.primarySecondColor,
            fontFamily: "Poppins",
          ),
        ),
        const SizedBox(height: 24),
        if (widget.project.url.isNotEmpty) _buildLinkRow(),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.project.name,
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: KColor.primarySecondColor,
        fontFamily: 'ShantellSans',
      ),
    );
  }

  Widget _buildLinkRow() {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const Icon(Icons.link, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final url = Uri.parse(widget.project.url);
                if (await canLaunchUrl(url)) {
                  await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                    webOnlyWindowName: '_blank',
                  );
                }
              },
              child: Text(
                widget.project.url,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(child: _buildTitle()),
          IconButton(
            icon: const Icon(Icons.close, size: 28, weight: 900),
            onPressed: widget.onClose ?? () => Navigator.of(context).maybePop(),
            tooltip: 'Close',
            style: ButtonStyle(
              iconColor: WidgetStateProperty.all(KColor.primarySecondColor),
              overlayColor: WidgetStateProperty.all(Colors.white12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Center(
      child: SizedBox(
        height: 400,
        child: KInfiniteScrollImage(images: widget.project.images),
      ),
    );
  }
}
