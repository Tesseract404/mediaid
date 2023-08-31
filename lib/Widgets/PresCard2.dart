import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart ';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class PresCard2 extends StatelessWidget {
  final String image;
  final title;
  final category;
  final route;
  final details;
  const PresCard2({Key? key, required this.image, this.title, this.category, this.route, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: GestureDetector(
        onTap: (){
          _showImageDialog(context);
        },
        child: Container(
          height: 125,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: CupertinoColors.white,
              boxShadow: [BoxShadow(
                color: Colors.black12,
                blurRadius: 1.0,
                spreadRadius: 0.2,
              )]
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: AssetImage(
                      image,
                    ),
                    height: 115,
                    width: 115,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7,),
                  Text(title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),
                  SizedBox(height: 5,),
                  Text(category,
                    style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                    ),),
                  SizedBox(height: 15,),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(7),
                  //     color:Color(0xffD8FCEB),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(3.0),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.star,
                  //           color:  Color(0xff38CC86),
                  //           size: 18,
                  //         ),
                  //         SizedBox(width: 5,),
                  //         Text('4.7',
                  //           style: TextStyle(
                  //               color: Color(0xff38CC86),
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 15
                  //           ),),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Row(
                    children: [
                      Icon(Icons.medical_information_rounded,size: 18,color: Colors.black26,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(details,
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w400,
                              fontSize: 14
                          ),),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            children: [
              Image(
                image: AssetImage(
                  image,
                ),
                height: 500,width: 600,
              ),
              // SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () async {
              //     await _checkAndRequestPermission(context,image);
              //   },
              //   child: Text("Download"),
              // ),
            ],
          ),
        );
      },
    );
  }
  Future<void> _downloadImage( String imageAssetPath) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final List<int> bytes = data.buffer.asUint8List();

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String imageName = '$dir/${imageAssetPath.split('/').last}';
    final String imagePath = '$dir/$imageName';

    File(imagePath).writeAsBytes(bytes);
  }
  Future<void> _checkAndRequestPermission(BuildContext context, String image) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      _downloadImage(  image);
      final snackBar = SnackBar(content: Text('Image downloaded'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("Permission denied for file storage.");
    }
  }
}