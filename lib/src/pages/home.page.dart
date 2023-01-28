import 'package:communicator/src/widgets/global/bottom.navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HOME PAGE'),
      ),
      bottomNavigationBar: BottomNavigation(pageIndex: 1),
    );
  }
}