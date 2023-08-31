import '../Model/ScheduleData.dart';

class ScheduleManager {
  static final ScheduleManager _instance = ScheduleManager._internal();

  factory ScheduleManager() {
    return _instance;
  }
  ScheduleManager._internal();

  final List<ScheduleData> _scheduleList = [];

  void addSchedule(ScheduleData scheduleData) {
    _scheduleList.add(scheduleData);
  }

  List<ScheduleData> get scheduleList => _scheduleList;
}