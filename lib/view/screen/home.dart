import 'package:flutter/material.dart';
import 'package:habit_tracker/view/widget/habit_box.dart';

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

  @override
  Widget build(BuildContext context) {
    var scheme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scheme.colorScheme.surfaceContainerLowest,
      body: Container(
        width: width,
        decoration: BoxDecoration(
          color: scheme.colorScheme.surfaceContainerLowest,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Greeting+date', style: TextStyle(color: Colors.white)),
            Text('CircularProgress', style: TextStyle(color: Colors.white)),
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
