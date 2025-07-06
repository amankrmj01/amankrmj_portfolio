import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/project.model.dart';
import 'package:portfolio/infrastructure/theme/colors.dart';
import 'package:portfolio/widgets/k.image.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkMobileView extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback? onClose;

  const WorkMobileView({super.key, required this.project, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: KColor.primarySecondColor,
            size: 28,
          ),
          onPressed: onClose ?? () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          project.name,
          style: TextStyle(
            color: KColor.primarySecondColor,
            fontFamily: "ShantellSans",
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 1.2,
            decoration: TextDecoration.none,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 520,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: project.images.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: KImage(url: project.images[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              project.name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: KColor.primarySecondColor,
                fontFamily: 'ShantellSans',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              project.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
                fontFamily: "Poppins",
              ),
            ),
            const SizedBox(height: 14),
            Text(
              project.largeDescription,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white60,
                fontFamily: "Poppins",
              ),
            ),
            const SizedBox(height: 20),
            if (project.url.isNotEmpty)
              GestureDetector(
                onTap: () async {
                  final url = Uri.parse(project.url);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                      webOnlyWindowName: '_blank',
                    );
                  }
                },
                child: Row(
                  children: [
                    const Icon(Icons.link, size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        project.url,
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
