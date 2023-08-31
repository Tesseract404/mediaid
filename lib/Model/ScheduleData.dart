class ScheduleData {
  final String? image;
  final String title;
  final String category;
  //final String hospital;
  final String time;
  final String date;
  final int id;

  ScheduleData({
    required this.id,
    required this.image,
    required this.title,
    required this.category,
   // required this.hospital,
    required this.date,
    required this.time,
   });
}