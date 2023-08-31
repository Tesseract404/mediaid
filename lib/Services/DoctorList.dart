import '../Model/doctorModel.dart';
class DoctorList {
  static final DoctorList _instance = DoctorList._internal();

  factory DoctorList() {
    return _instance;
  }

  DoctorList._internal();

  List<doctorModel> _doctorList = [];

  List<doctorModel> get doctorList => _doctorList;

  // void addDoctor(doctorModel doctor) {
  //   _doctorList.add(doctor);
  // }
  void addDoctor (List<doctorModel>? doctors) {
    _doctorList.addAll(doctors!);
  }
}