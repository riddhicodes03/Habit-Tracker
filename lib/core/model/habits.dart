import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Habits {
  Habits({required this.title,
   required this.createdAt,
   id}):id=id??uuid.v4();
  final String id;
  final String title;
  final DateTime createdAt;
}
