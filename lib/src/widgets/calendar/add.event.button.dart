import 'package:communicator/src/services/user.service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app.color.dart';
import 'add.event.modal.dart';

class AddEventButton extends StatelessWidget {
  const AddEventButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService.adminControlActivated(),
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.data == true,
            child: GestureDetector(
              onTap: () => {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) => const AddEventModal(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                )
              },
              child: Container(
                color: AppColors.gray,
                width: double.infinity,
                height: 50,
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    size: 30,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
