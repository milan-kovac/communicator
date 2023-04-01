import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 5,
        backgroundColor: AppColors.darkGrean,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.bars,
            size: 28,
          ),
          color: Colors.white,
          onPressed: () => Scaffold.of(context).openDrawer(),
        ));
  }
}
