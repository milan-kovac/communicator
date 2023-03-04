import 'package:communicator/src/widgets/settings/admin.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/global/custom.app.bar.dart';
import '../widgets/global/sidebar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
      drawer: Sidebar(currentPageIndex: 5),
      body: const AdminAction(),
    );
  }
}
