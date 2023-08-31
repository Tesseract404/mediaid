import 'package:fluttertoast/fluttertoast.dart';
import 'dart:typed_data';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart%20';

import '../Screens/DocProfile.dart';

class FullImageScreen extends StatelessWidget {
  final String? imageProvider;

  FullImageScreen({required this.imageProvider});
  Future<void> _downloadImage() async {
    try {
      final ByteData bytes = await rootBundle.load(imageProvider!);
      final Uint8List uint8List = bytes.buffer.asUint8List();
      await FlutterShare.shareFile(
        title: 'Download Image',
        filePath: 'image.jpg',
        fileType: uint8List.toString(),
      );
      Fluttertoast.showToast(msg: 'Image saved');
    } catch (e) {
      print('Error downloading image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          //   child:
          //   IconButton(
          //       onPressed: _downloadImage,
          //       icon: Icon(
          //           Icons.download_sharp,
          //         color: Colors.white54,
          //         size: 30,
          //       )
          //   ),
          // ),
          Center(
            child: Hero(
              tag: 'imageHero',
              child: Image(
                image: imageProvider!.isNotEmpty
                    ? (showImage(imageProvider!) as Image).image
                    : const AssetImage('default_image_path.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}