
import 'package:habit_tracker/core/database/database_helper.dart';
import 'package:habit_tracker/core/model/habits.dart';
import 'package:riverpod/legacy.dart';
import 'package:uuid/uuid.dart';

class HabitNotifier extends StateNotifier<List<Habits>> {
  HabitNotifier() : super([]);

  final DBHelper _db = DBHelper();

  // 🔹 LOAD ALL HABITS
  Future<void> loadHabits() async {
    final data = await _db.getHabits();

    state = data.map((e) => Habits.fromMap(e)).toList();
  }

  // 🔹 ADD Habits
  Future<void> addHabit(String name) async {
    final habit = Habits(
      id: const Uuid().v4(),
      title: name,
      createdAt: DateTime.now(),
    );

    await _db.insertHabit(habit.toMap());

    state = [...state, habit];
  }

  // 🔹 TOGGLE Habits
  Future<void> toggleHabit(String habitId) async {
    await _db.toggleHabit(habitId);

    // reload logs or UI will not update properly
    await loadHabits();
  }
}
final habitProvider = StateNotifierProvider<HabitNotifier, List<Habits>>((ref) {
  return HabitNotifier();
});