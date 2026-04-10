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
              title: 'Wake up at 5am',
              onChange: onToggle,
              isChecked: false,
            ),
            HabitBox(
              title: 'Drink 7 litres of water',
              onChange: onToggle,
              isChecked: false,
            ),
            HabitBox(
              title: 'Meditate for 30 Mins',
              onChange: onToggle,
              isChecked: false,
            ),
            Text('This Month', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
