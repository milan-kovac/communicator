import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/global/bottom.navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EventCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: 'en',
          dateTime: CalendarDateTime(
              year: 2023,
              day: 28,
              month: 1,
              calendarType: CalendarType.GREGORIAN),
          calendarOptions: CalendarOptions(viewType: ViewType.DAILY),
          dayOptions: DayOptions(
              selectedBackgroundColor: AppColors.darkGrean,
              weekDaySelectedColor: AppColors.darkGrean),
          headerOptions: HeaderOptions(monthStringType: MonthStringTypes.FULL),
          middleWidget: (p0) => Container(
            color: AppColors.lightGrean,
            width: double.infinity,
            height: 50,
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.circlePlus,
                size: 30,
              ),
            ),
          ),
          events: [
            for (int i = 0; i < 100; i++)
              Event(
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text('Otici u skolu',
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Center(
                                  child: FaIcon(FontAwesomeIcons.circlePlay))),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(' 12:00 h'),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                          'https://prima.edu.rs/img/home/about-us.jpg'),
                    ],
                  ),
                ),
                dateTime: CalendarDateTime(
                  year: 2023,
                  month: 1,
                  day: 28,
                  calendarType: CalendarType.GREGORIAN,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(pageIndex: 0),
    );
  }
}
