import 'package:communicator/src/services/user.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Administrator kontrola',
                                style: TextStyle(color: AppColors.fadedBlack, fontSize: 16.sp, fontWeight: FontWeight.w900),
                              ),
                              snapshot.hasData
                                  ? Checkbox(
                                      value: snapshot.data?.adminControl,
                                      onChanged: (value) {
                                        setState(() {
                                          UserService.setAdminControl();
                                        });
                                      },
                                      activeColor: AppColors.darkGrean,
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.all(10.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Trenutan mejl',
                                style: TextStyle(color: AppColors.fadedBlack, fontSize: 16.sp, fontWeight: FontWeight.w900),
                              ),
                              Text(snapshot.data?.email ?? '',
                                  style: TextStyle(color: const Color.fromARGB(255, 66, 64, 64), fontSize: 15.sp, fontWeight: FontWeight.w900))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: GestureDetector(
                      onTap: () => AuthService.logOut(context),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          //color: const  Color.fromARGB(255, 128, 31, 31),
                          child: Text(
                            'Odjava',
                            style: TextStyle(fontSize: 19.sp, color: AppColors.darkGrean, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
