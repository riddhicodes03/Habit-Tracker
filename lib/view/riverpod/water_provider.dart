import 'package:habit_tracker/core/database/database_helper.dart';
import 'package:habit_tracker/core/model/water.dart';
import 'package:riverpod/legacy.dart';

class WaterNotifier extends StateNotifier<List<Water>> {
  WaterNotifier() : super([]);
  final DBHelper _db = DBHelper();
  Future<void> loadWater() async {
    final data = await _db.getWaterLogs();
    state = data.map((e) => Water.fromMap(e)).toList();
  }

  void addWater(double litres) async {
    final todayWater = await getTodayWater();

    if (todayWater != null) {
      final updated = todayWater.copyWith(litres: todayWater.litres + litres);
      await _db.updateWater(updated.toMap());
      state = [
        for (final w in state)
          if (w.id == updated.id) updated else w,
      ];
    }
    final water = Water(date: DateTime.now(), litres: litres);
    await _db.insertWater(water.toMap());
    state = [...state, water];
  }

  void updateWater(Map<String, dynamic> data) async {
    await _db.updateWater(data);
    final updatedWater = Water.fromMap(data);
    state = [
      for (final w in state)
        if (w.id == updatedWater.id) updatedWater else w,
    ];
  }

  Future<Water?> getTodayWater() async {
    final today = DateTime.now().toIso8601String().split('T')[0];

    final data = await _db.getWaterByDate(today);

    if (data.isNotEmpty) {
      return Water.fromMap(data.first);
    }
    return null;
  }
}

final waterProvider = StateNotifierProvider<WaterNotifier, List<Water>>((ref) {
  return WaterNotifier();
});
