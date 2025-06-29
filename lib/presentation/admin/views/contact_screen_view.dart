import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/domain/models/contact_form.model.dart';
import 'package:portfolio/infrastructure/dal/services/fetch.contact.service.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../widgets/mesh.background.dart';
import '../widgets/file.card.dart';

class ContactScreenView extends StatefulWidget {
  const ContactScreenView({super.key});

  @override
  State<ContactScreenView> createState() => _ContactScreenViewState();
}

class _ContactScreenViewState extends State<ContactScreenView> {
  static List<ContactFormModel>? _cachedFiles;
  bool _isLoading = true;
  late List<ContactFormModel> files = [];

  @override
  void initState() {
    super.initState();
    _loadFilesWithLengthCheck();
  }

  Future<void> _loadFilesWithLengthCheck() async {
    setState(() => _isLoading = true);
    final FetchContactService fetchContactService = FetchContactService();
    final fetchedFiles = await fetchContactService.fetchContacts();
    if (_cachedFiles == null || _cachedFiles!.length != fetchedFiles.length) {
      files = fetchedFiles;
      _cachedFiles = fetchedFiles;
    } else {
      files = _cachedFiles!;
    }
    setState(() => _isLoading = false);
  }

  Future<void> _refreshFiles() async {
    setState(() => _isLoading = true);
    final FetchContactService fetchContactService = FetchContactService();
    _cachedFiles = await fetchContactService.fetchContacts();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            // AppBar replacement as a Stack
            Positioned.fill(child: const SharedMeshBackground()),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : files.isEmpty
                ? const Center(child: Text('No files found'))
                : ListView.builder(
                    padding: EdgeInsets.only(top: kToolbarHeight + 8),
                    itemCount: files.length,
                    itemBuilder: (context, index) {
                      final file = files[files.length - 1 - index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: FileCard(file: file),
                      );
                    },
                  ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: kToolbarHeight,
                color: Color.lerp(Colors.black, Colors.transparent, 0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    20.widthBox,
                    IconButton(
                      icon: const Icon(Atlas.arrow_left, color: Colors.white),
                      tooltip: 'Back',
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'ContactScreenView',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "ShantellSans",
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      tooltip: 'Refresh',
                      onPressed: _refreshFiles,
                    ),
                    20.widthBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateful card widget for each file
