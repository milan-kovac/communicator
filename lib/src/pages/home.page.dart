import 'package:communicator/src/widgets/global/custom.app.bar.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: Center(
        child: Text('HOME PAGE'),
      ),
      drawer: Sidebar(),
    );
  }
}
