import 'package:communicator/src/widgets/global/bottom.navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('LERANING PAGE'),
      ),
      bottomNavigationBar: BottomNavigation(pageIndex: 2),
    );
  }
}