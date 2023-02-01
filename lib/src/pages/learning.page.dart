import 'package:flutter/material.dart';
import '../widgets/global/custom.app.bar.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      body: Center(
        child: Text('LERANING PAGE'),
      ),
    );
  }
}