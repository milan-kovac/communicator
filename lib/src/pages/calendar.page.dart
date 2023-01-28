import 'package:communicator/src/widgets/global/bottom.navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('CALENDAR PAGE'),
      ),
      bottomNavigationBar: BottomNavigation(pageIndex: 0),
    );
  }
}