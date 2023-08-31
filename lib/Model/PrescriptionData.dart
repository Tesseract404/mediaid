import 'package:flutter/cupertino.dart';

class PrescriptionData {
  //final ImageProvider image;
  final int id;
  final String? image;
  final String title;
  final String category;
  final String details;

  PrescriptionData({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
    required this.details,
  });
}