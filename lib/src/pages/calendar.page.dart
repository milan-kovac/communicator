import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/calendar/add.event.modal.dart';
import '../widgets/global/custom.app.bar.dart';
import '../widgets/global/sidebar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: CustomAppBar()),
      drawer: const Sidebar(),
      body: SafeArea(
        child: EventCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: 'en',
          dateTime: CalendarDateTime(
              year: 2023,
              day: 28,
              month: 1,
              calendarType: CalendarType.GREGORIAN),
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
          ),
          dayOptions: DayOptions(
            disableDaysBeforeNow: false,
              selectedBackgroundColor: AppColors.darkGrean,
              weekDaySelectedColor: AppColors.darkGrean),
          headerOptions: HeaderOptions(monthStringType: MonthStringTypes.SHORT, weekDayStringType: WeekDayStringTypes.SHORT),
          middleWidget: (p0) => GestureDetector(
            onTap: () => {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) => AddEventModal(),
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
              )
            },
            child: Container(
              color: AppColors.lightGrean,
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
          events: [
            for (int i = 0; i < 100; i++)
              Event(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: const DecorationImage(
                            image: NetworkImage('https://picsum.photos/1000'),
                            alignment: Alignment.topLeft),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      width: deviceWidth - 20,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "12:30 ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                    WidgetSpan(
                                      child: FaIcon(FontAwesomeIcons.clock,
                                          size: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
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
    );
  }
}
