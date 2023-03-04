import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:communicator/src/services/user.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../services/auth.service.dart';

class AdminAction extends StatefulWidget {
  const AdminAction({super.key});

  @override
  State<AdminAction> createState() => _AdminActionState();
}

class _AdminActionState extends State<AdminAction> {
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService.getLocalUser(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Administrator kontrola',
                            style: TextStyle(color: AppColors.fadedBlack, fontSize: 15.sp, fontWeight: FontWeight.w900),
                          ),
                          snapshot.hasData
                              ? AnimatedToggleSwitch<bool>.dual(
                                  current: snapshot.data?.adminControl == true,
                                  first: true,
                                  second: false,
                                  dif: 50.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 5.r,
                                  height: 55.h,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 1.5),
                                    ),
                                  ],
                                  onChanged: (b) async {
                                    setState(() => positive = b);
                                    UserService.setAdminControl();
                                    return Future.delayed(const Duration(seconds: 2));
                                  },
                                  colorBuilder: (b) => b ? Colors.green : Colors.red,
                                  iconBuilder: (value) => value
                                      ? FaIcon(
                                          FontAwesomeIcons.lockOpen,
                                          size: 25.r,
                                        )
                                      : FaIcon(
                                          FontAwesomeIcons.lock,
                                          size: 25.r,
                                        ),
                                  textBuilder: (value) => value
                                      ? Center(
                                          child: Text(
                                          'Aktivno',
                                          style: TextStyle(color: AppColors.fadedBlack, fontWeight: FontWeight.w700, fontSize: 15.sp),
                                        ))
                                      : Center(
                                          child: Text('Neaktivno',
                                              style: TextStyle(color: AppColors.fadedBlack, fontWeight: FontWeight.w900, fontSize: 15.sp))))
                              : const SizedBox()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trenutan mejl',
                              style: TextStyle(color: AppColors.fadedBlack, fontSize: 15.sp, fontWeight: FontWeight.w900),
                            ),
                            Text(snapshot.data?.email ?? '',
                                style:
                                    TextStyle(color: AppColors.fadedBlack, fontSize: 15.sp, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () => AuthService.logOut(context),
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      alignment: Alignment.center,
                      color: AppColors.gray,
                      child: Text(
                        'Odjava',
                        style: TextStyle(fontSize: 16.sp, color: AppColors.fadedBlack, fontWeight: FontWeight.w900),
                      ),
                    ),
                  )),
            ],
          );
        });
  }
}
