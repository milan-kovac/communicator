import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/custom.app.bar.dart';
import 'package:communicator/src/widgets/global/sidebar.dart';
import 'package:communicator/src/widgets/home/about.items.dart';
import 'package:communicator/src/widgets/home/map.location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFe8eaed),
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
      drawer: Sidebar(currentPageIndex: 0),
      body: SafeArea(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              AboutItems(),
              MapLocation(),
            ],
          ),
        ),
      ),
    );
  }
}
