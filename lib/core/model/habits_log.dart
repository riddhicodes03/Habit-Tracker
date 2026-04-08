import 'package:uuid/uuid.dart';

const uuid = Uuid();

class HabitLog {
  final String? id;
  final String habitId;
  final String date;
  final int status;

  HabitLog({
    id,
    required this.habitId,
    required this.date,
    required this.status,
  }):id=id??uuid.v4();
}
