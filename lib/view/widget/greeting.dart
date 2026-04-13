import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  const Greeting({super.key});

  @override
  State<Greeting> createState() => _GreetingState();
}

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) {
    return "Good Morning";
  } else if (hour >= 12 && hour < 17) {
    return "Good Afternoon";
  } else if (hour >= 17 && hour < 21) {
    return "Good Evening";
  } else {
    return "Good Night";
  }
}

String getDay() {
  final date = DateTime.now().weekday;
  switch (date) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thrusday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 0:
      return 'Sunday';
    default:
      return '';
  }
}

String getMonth() {
  final month = DateTime.now().month;
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}

class _GreetingState extends State<Greeting> {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context);
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getGreeting(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: scheme.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 3),
          Text(
            '${getDay()},${DateTime.now().day.toString()} ${getMonth().substring(0, 3)}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: scheme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
