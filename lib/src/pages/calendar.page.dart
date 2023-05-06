import 'dart:math';

import 'package:communicator/src/models/event.dart';
import 'package:communicator/src/services/event.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/calendar/add.event.button.dart';
import 'package:communicator/src/widgets/calendar/calendar.event.dart';
import 'package:communicator/src/widgets/calendar/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: PreferredSize(preferredSize: Size.fromHeight(50.h), child: const CustomAppBar()),
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
                    middleWidget: (p0) => const AddEventButton(),
                    events: snapshot.hasData
                        ? [
                            for (int i = 0; i < snapshot.data!.length; i++)
                              Event(
                                child: CalendarEvent(data: snapshot.data![i]),
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
