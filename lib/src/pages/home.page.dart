import 'package:communicator/src/widgets/global/custom.app.bar.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
      drawer: Sidebar(currentPageIndex: 0),
    );
  }
}
