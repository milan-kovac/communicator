import 'package:cached_network_image/cached_network_image.dart';
import 'package:communicator/src/services/event.service.dart';
import 'package:communicator/src/widgets/calendar/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/event.dart';
import '../../services/user.service.dart';
import '../../utils/app.color.dart';

class CalendarEvent extends StatefulWidget {
  final EventModel data;
  const CalendarEvent({super.key, required this.data});

  @override
  State<CalendarEvent> createState() => _CalendarEventState();
}

class _CalendarEventState extends State<CalendarEvent> {
  Future _delete(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Molimo Potvrdite'),
            content: const Text('Da li ste sigurni da želite obrisati ovo?'),
            actions: [
              TextButton(
                  onPressed: () {
                    EventService.deletEvent(widget.data.id);
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    'Da',
                    style: TextStyle(color: Colors.green, fontSize: 18.sp),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    'Ne',
                    style: TextStyle(color: Colors.red, fontSize: 18.sp),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService.adminControlActivated(),
        builder: (context, snapshot) {
          return Dismissible(
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                return await _delete(context);
              }
              return false;
            },
            background: Center(child: FaIcon(FontAwesomeIcons.trash, color: Colors.red, size: 45.r)),
            direction: snapshot.data == true ? DismissDirection.endToStart : DismissDirection.none,
            key: Key(widget.data.id),
            child: Container(
              margin: EdgeInsets.only(bottom: 80.r),
              child: Padding(
                padding: EdgeInsets.all(9.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5.r,
                        blurRadius: 7.r,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: CachedNetworkImage(
                              height: 200.h,
                              fit: BoxFit.cover,
                              imageUrl: widget.data.image,
                              placeholder: (context, url) => Center(child: SpinKitRing(color: AppColors.fadedBlack, size: 60.r, lineWidth: 3)),
                              errorWidget: (context, url, error) => Icon(Icons.error, size: 60.r, color: AppColors.error),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              height: 200.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 8.r, top: 10.r),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: EventModel.getFormatedStringTime(widget.data.date),
                                              style: const TextStyle(color: AppColors.darkGrean, fontSize: 15, fontWeight: FontWeight.bold)),
                                          const WidgetSpan(
                                            child: FaIcon(FontAwesomeIcons.clock, size: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.r, top: 10.r),
                                    child: Text(widget.data.description, style: const TextStyle(color: AppColors.darkGrean, fontSize: 15)),
                                  ),
                                  Expanded(
                                    flex: 9,
                                    child: Visibility(
                                      visible: widget.data.audio.isNotEmpty,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 8.r, top: 10.r),
                                        child: Align(child: Player(uri: widget.data.audio)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
