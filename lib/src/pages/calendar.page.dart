import 'package:communicator/src/models/event.dart';
import 'package:communicator/src/services/event.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/calendar/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/calendar/add.event.modal.dart';
import '../widgets/global/custom.app.bar.dart';
import '../widgets/global/sidebar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      drawer: Sidebar(currentPageIndex: 1),
      body: SafeArea(
        child: StreamBuilder<List<EventModel>>(
            stream: EventService.getEvents(),
            builder: (context, snapshot) {
              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: EventCalendar(
                    calendarType: CalendarType.GREGORIAN,
                    calendarLanguage: 'en',
                    dateTime: CalendarDateTime(year: now.year, day: now.day, month: now.month, calendarType: CalendarType.GREGORIAN),
                    calendarOptions: CalendarOptions(
                      viewType: ViewType.DAILY,
                    ),
                    dayOptions: DayOptions(
                        disableDaysBeforeNow: false, selectedBackgroundColor: AppColors.darkGrean, weekDaySelectedColor: AppColors.darkGrean),
                    headerOptions: HeaderOptions(monthStringType: MonthStringTypes.SHORT, weekDayStringType: WeekDayStringTypes.SHORT),
                    eventOptions: EventOptions(emptyIcon: FontAwesomeIcons.calendar, emptyIconColor: AppColors.fadedBlack, emptyText: ''),
                    middleWidget: (p0) => GestureDetector(
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
                    events: snapshot.hasData
                        ? [
                            for (int i = 0; i < snapshot.data!.length; i++)
                              Event(
                                child: Container(
                                  margin: EdgeInsets.only(bottom:80.r),
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
                                          Dismissible(
                                            direction: DismissDirection.endToStart,
                                            background: Container(
                                              color: AppColors.error,
                                              child: Center(
                                                  child: FaIcon(
                                                FontAwesomeIcons.trash,
                                                size: 50.r,
                                                color: Colors.white,
                                              )),
                                            ),
                                            key: ValueKey<int>(i),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: CachedNetworkImage(
                                                    height: 200.h,
                                                    fit: BoxFit.cover,
                                                    imageUrl: snapshot.data![i].image,
                                                    placeholder: (context, url) =>
                                                        Center(child: SpinKitRing(color: AppColors.fadedBlack, size: 60.r, lineWidth: 3)),
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
                                                                    text: EventModel.getFormatedStringTime(snapshot.data![i].date),
                                                                    style: const TextStyle(
                                                                        color: AppColors.darkGrean, fontSize: 15, fontWeight: FontWeight.bold)),
                                                                const WidgetSpan(
                                                                  child: FaIcon(FontAwesomeIcons.clock, size: 16),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(left: 8.r, top: 10.r),
                                                          child: Text(snapshot.data![i].description,
                                                              style: const TextStyle(color: AppColors.darkGrean, fontSize: 15)),
                                                        ),
                                                        Expanded(
                                                          flex: 9,
                                                          child: Visibility(
                                                            visible: snapshot.data![i].audio.isNotEmpty,
                                                            child: Container(
                                                              margin: EdgeInsets.only(left: 8.r, top: 10.r),
                                                              child: Align(child: Player(uri: snapshot.data![i].audio)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                dateTime: CalendarDateTime(
                                  year: snapshot.data![i].date.year,
                                  month: snapshot.data![i].date.month,
                                  day: snapshot.data![i].date.day,
                                  calendarType: CalendarType.GREGORIAN,
                                ),
                              ),
                          ]
                        : null),
              );
            }),
      ),
    );
  }
}
