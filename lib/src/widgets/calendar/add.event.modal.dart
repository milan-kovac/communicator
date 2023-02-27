import 'dart:io';
import 'package:communicator/src/services/event.service.dart';
import 'package:communicator/src/services/image.service.dart';
import 'package:communicator/src/utils/app.color.dart';
import 'package:communicator/src/widgets/calendar/recording.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class AddEventModal extends StatefulWidget {
  const AddEventModal({super.key});
  @override
  State<AddEventModal> createState() => _AddEventModalState();
}

class _AddEventModalState extends State<AddEventModal> {
  DateTime now = DateTime.now();
  TextEditingController dateController = TextEditingController(text: formatDataString(DateTime.now()));
  TextEditingController timeController = TextEditingController(text: formatTimeString(TimeOfDay.fromDateTime(DateTime.now())));
  TextEditingController descriptionController = TextEditingController();
  bool imageIsPicked = false;
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.fromDateTime(DateTime.now());
  bool spinner = false;
  dynamic imageFile, audioFile;

  void setSinner() {
    setState(() {
      spinner = !spinner;
    });
  }

  void setAudio(File audioFile) {
    setState(() {
      this.audioFile = audioFile;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //initial image
      ImageService.loadImageFromAsset('noImage.jpg').then((file) {
        setState(() {
          imageFile = file;
        });
      });

      //inital audio
      audioFile = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500.h,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 130.w,
              height: 8.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r), color: AppColors.darkGrean),
              margin: EdgeInsets.only(top: 20.r, bottom: 20.r),
            ),
            Padding(
              padding: EdgeInsets.all(30.r),
              child: TextField(
                cursorColor: AppColors.darkGrean,
                maxLength: 80,
                style: const TextStyle(decorationThickness: 0, decoration: TextDecoration.none, color: AppColors.darkGrean),
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Opis . . .",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.darkGrean, width: 2.w),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.darkGrean, width: 2.w),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.r),
              child: Row(
                children: [
                  /** DATE PICKER **/
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: dateController.text,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          icon: FaIcon(FontAwesomeIcons.calendarPlus,
                              color: FocusScope.of(context).isFirstFocus ? AppColors.darkGrean : AppColors.darkGrean),
                          onPressed: null,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.darkGrean, width: 2.w),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.darkGrean, width: 2.w),
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
                                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          helpText: '',
                          initialDate: now,
                          firstDate: now,
                          lastDate: DateTime(now.year + 100),
                        ).then((pickedDate) {
                          if (pickedDate == null) {
                            return;
                          } else {
                            setState(() {
                              this.pickedDate = pickedDate;
                              String dateControllerText = formatDataString(pickedDate);
                              dateController.value = TextEditingValue(
                                text: dateControllerText,
                                selection: TextSelection.fromPosition(
                                  TextPosition(offset: dateControllerText.length),
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
                        hintText: timeController.text,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          icon:
                              FaIcon(FontAwesomeIcons.clock, color: FocusScope.of(context).isFirstFocus ? AppColors.darkGrean : AppColors.darkGrean),
                          onPressed: null,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.darkGrean, width: 2.w),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.darkGrean, width: 2.w),
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
                                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          helpText: '',
                          initialTime: TimeOfDay.fromDateTime(now),
                        ).then((pickedTime) {
                          if (pickedTime == null) {
                            return;
                          } else {
                            setState(() {
                              this.pickedTime = pickedTime;
                              String timeControllerText = formatTimeString(pickedTime);
                              timeController.value = TextEditingValue(
                                text: timeControllerText,
                                selection: TextSelection.fromPosition(
                                  TextPosition(offset: timeControllerText.length),
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
              padding: EdgeInsets.only(left: 30.r, right: 30.r),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: GestureDetector(
                        onTap: () async {
                          final pickedImage = await ImageService.pickImageFromGallery();
                          if (pickedImage != null) {
                            setState(() {
                              imageFile = pickedImage;
                              imageIsPicked = true;
                            });
                          }
                        },
                        child: SizedBox(
                            height: 100.h,
                            width: 100.w,
                            child: imageIsPicked
                                ? Container(
                                    decoration: imageFile is File
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(imageFile),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : null,
                                    height: 100,
                                    child: null)
                                : Center(
                                    child: FaIcon(
                                      FontAwesomeIcons.fileImage,
                                      color: AppColors.darkGrean,
                                      size: 35.r,
                                    ),
                                  )),
                      )),
                  const Expanded(flex: 4, child: SizedBox()),
                  Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: Recording(setAudio: setAudio),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.r, right: 30.r),
              child: Container(
                  width: double.infinity,
                  height: 50.h,
                  margin: EdgeInsets.only(top: 40.r),
                  child: TextButton(
                    onPressed: () {
                      setSinner();
                      EventService.addEvent(descriptionController.text, imageFile, pickedDate, pickedTime, audioFile)
                          .then((value) => {setSinner(), Navigator.pop(context)});
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.gray),
                        overlayColor: MaterialStateProperty.all(AppColors.gray),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ))),
                    child: spinner
                        ? Center(child: SpinKitRing(color: AppColors.darkGrean, size: 35.sp, lineWidth: 4))
                        : Text(
                            'Dodaj',
                            style: TextStyle(color: AppColors.fadedBlack, fontSize: 18.sp, fontWeight: FontWeight.w900),
                          ),
                  )),
            )
          ],
        ));
  }
}

String formatDataString(DateTime date) {
  return '${date.month}/${date.day}/${date.year}';
}

String formatTimeString(TimeOfDay time) {
  var minute = time.minute < 10 ? '0${time.minute}' : time.minute.toString();
  var hour = time.hour < 10 ? '0${time.hour}' : time.hour.toString();
  return '$hour:$minute';
}
