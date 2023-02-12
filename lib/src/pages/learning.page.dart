import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import '../widgets/global/custom.app.bar.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      drawer: Sidebar(currentPageIndex: 2),
      body: const Center(
        child: Text('LERANING PAGE'),
      ),
    );
  }
}
