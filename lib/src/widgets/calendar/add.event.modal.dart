import 'package:communicator/src/utils/app.color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddEventModal extends StatefulWidget {
  DateTime now = DateTime.now();
  TextEditingController dateController =
      TextEditingController(text: formatDataString(DateTime.now()));
  TextEditingController timeController = TextEditingController(
      text: formatTimeString(TimeOfDay.fromDateTime(DateTime.now())));
  AddEventModal({super.key});

  @override
  State<AddEventModal> createState() => _AddEventModalState();
}

class _AddEventModalState extends State<AddEventModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 130,
              height: 8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.darkGrean),
              margin: const EdgeInsets.only(top: 20, bottom: 20),
            ),
            //
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  /** DATE PICKER **/
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: widget.dateController.text,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.calendarPlus,
                              color: FocusScope.of(context).isFirstFocus
                                  ? AppColors.darkGrean
                                  : AppColors.darkGrean),
                          onPressed: null,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkGrean, width: 3),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkGrean, width: 3),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.darkGrean,
                                  onPrimary: Colors.white,
                                  onSurface: Colors.black,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          helpText: '',
                          initialDate: widget.now,
                          firstDate: widget.now,
                          lastDate: DateTime(widget.now.year + 100),
                        ).then((pickedDate) {
                          if (pickedDate == null) {
                            return;
                          } else {
                            setState(() {
                              String dateControllerText =
                                  formatDataString(pickedDate);
                              widget.dateController.value = TextEditingValue(
                                text: dateControllerText,
                                selection: TextSelection.fromPosition(
                                  TextPosition(
                                      offset: dateControllerText.length),
                                ),
                              );
                            });
                          }
                        });
                      },
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  /** TME PICKER **/
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: widget.timeController.text,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.clock,
                              color: FocusScope.of(context).isFirstFocus
                                  ? AppColors.darkGrean
                                  : AppColors.darkGrean),
                          onPressed: null,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkGrean, width: 3),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.darkGrean, width: 3),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        showTimePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: AppColors.darkGrean,
                                  onPrimary: Colors.white,
                                  onSurface: Colors.black,
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          helpText: '',
                          initialTime: TimeOfDay.fromDateTime(widget.now),
                        ).then((pickedTime) {
                          if (pickedTime == null) {
                            return;
                          } else {
                            setState(() {
                              String timeControllerText =
                                  formatTimeString(pickedTime);
                              widget.timeController.value = TextEditingValue(
                                text: timeControllerText,
                                selection: TextSelection.fromPosition(
                                  TextPosition(
                                      offset: timeControllerText.length),
                                ),
                              );
                            });
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          dashPattern: [5, 5],
                          color: AppColors.darkGrean,
                          strokeWidth: 2,
                          child: const SizedBox(
                              height: 100,
                              child: Center(
                                  child: FaIcon(FontAwesomeIcons.paperclip,
                                      size: 30))))),
                  const Expanded(flex: 4, child: SizedBox()),
                  Expanded(
                      flex: 4,
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          dashPattern: const [5, 5],
                          color: AppColors.darkGrean,
                          strokeWidth: 2,
                          child: const SizedBox(
                              height: 100,
                              child: Center(
                                  child: FaIcon(FontAwesomeIcons.microphone,
                                      size: 30))))),
                ],
              ),
            )
          ],
        ));
  }
}

String formatDataString(DateTime date) {
  return '${date.month}/${date.day}/${date.year}';
}

String formatTimeString(TimeOfDay time) {
  return '${time.hour}:${time.minute}';
}
