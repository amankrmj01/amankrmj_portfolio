import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PdfImage extends StatefulWidget {
  const PdfImage({super.key});

  @override
  State<PdfImage> createState() => PdfImageState();
}

class PdfImageState extends State<PdfImage> {
  Uint8List? image;

  void renderPdfImage() async {
    // Pick a PDF file
    String? path = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf'])
        .then((result) => result?.files.single.path);
    if (path == null) return;

    _renderPdfFromPath(path);
  }

  Future<void> renderPdfFromUrl(String url) async {
    // Download PDF to temp file
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/downloaded_pdf.pdf');
      await tempFile.writeAsBytes(response.bodyBytes);
      await _renderPdfFromPath(tempFile.path);
    } else {
      throw Exception('Failed to download PDF');
    }
  }

  Future<void> _renderPdfFromPath(String path) async {
    final pdf = PdfImageRenderer(path: path);
    await pdf.open();
    await pdf.openPage(pageIndex: 0);
    final size = await pdf.getPageSize(pageIndex: 0);
    final img = await pdf.renderPage(
      pageIndex: 0,
      x: 0,
      y: 0,
      width: size.width,
      height: size.height,
      scale: 1,
      background: Colors.white,
    );
    await pdf.closePage(pageIndex: 0);
    await pdf.close();
    setState(() {
      image = img;
    });
  }

  @override
  void initState() {
    super.initState();
    // renderPdfImage();
    // For testing, you can directly call a URL here
    // renderPdfImageFromUrl('https://www.example.com/sample.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('pdf_image_renderer')),
        body: Center(
          child: image != null
              ? Image(image: MemoryImage(image!))
              : const Text("Loading..."),
        ),
      ),
    );
  }
}
