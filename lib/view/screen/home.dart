import 'package:flutter/material.dart';
import 'package:habit_tracker/view/widget/add_water_button.dart';
import 'package:habit_tracker/view/widget/greeting.dart';
import 'package:habit_tracker/view/widget/habit_box.dart';
import 'package:habit_tracker/view/widget/water_ring.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  void onToggle(bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  }

  void addWater() {}
  @override
  Widget build(BuildContext context) {
    var scheme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scheme.colorScheme.surfaceContainerLowest,
      body: Container(
        margin: EdgeInsets.all(8),
        width: width,
        decoration: BoxDecoration(
          color: scheme.colorScheme.surfaceContainerLowest,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Greeting(),
            SizedBox(height: 10),
            WaterRing(current: 1000, goal: 3500),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Goal 3500 ml :',
                  style: TextStyle(
                    color: scheme.colorScheme.onSurface,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  '${(1000 / 3500 * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddWaterButton(amount: 100, onTap: addWater),
                SizedBox(width: 10),
                AddWaterButton(amount: 250, onTap: addWater),
                SizedBox(width: 10),
                AddWaterButton(amount: 500, onTap: addWater),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(left: 14),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Today\'s Habits',

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            HabitBox(
              title: "Exercise",
              streakText: "5 day streak",
              isChecked: true,
              onChange: (val) {
                print(val);
              },
              icon: Icons.bolt,
              iconColor: Colors.green,
            ),

            HabitBox(
              title: "Read 20 mins",
              streakText: "3 day streak",
              isChecked: false,
              onChange: (val) {},
              icon: Icons.menu_book,
              iconColor: Colors.indigo,
            ),

            HabitBox(
              title: "Sleep by 11pm",
              streakText: "No streak yet",
              isChecked: false,
              onChange: (val) {},
              icon: Icons.nightlight_round,
              iconColor: Colors.orange,
            ),
            Text('This Month', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
