import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          children: [
            Text('Greeting+date', style: TextStyle(color: Colors.white)),
            Text('CircularProgress', style: TextStyle(color: Colors.white)),
            Text('List of Habits', style: TextStyle(color: Colors.white)),
            Text('This Month', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
