import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Water {
  Water({
    required this.date,
    required this.litres,
    String? id,
  }) : id = id ?? uuid.v4();

  final String id;
  final double litres;
  final DateTime date;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'litres': litres,
      'date': date.toIso8601String(),
    };
  }

  factory Water.fromMap(Map<String, dynamic> map) {
    return Water(
      id: map['id'],
      litres: map['litres'],
      date: DateTime.parse(map['date']),
    );
  }
}