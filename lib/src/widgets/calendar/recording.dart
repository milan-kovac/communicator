import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:communicator/src/services/audio.service.dart';
import 'package:communicator/src/utils/app.color.dart';

class Recording extends StatefulWidget {
  final void Function(File) setAudio;
  const Recording({super.key, required this.setAudio});

  @override
  State<Recording> createState() => _RecordingState();
}

class _RecordingState extends State<Recording> {
  FlutterSoundRecorder recorderModule = FlutterSoundRecorder();
  late String recordPath;
  bool isRecording = false;
  Stream<int>? timerStream;
  StreamSubscription<int>? timerSubscription;
  String minutesStr = '00';
  String secondsStr = '00';

  void initSettings() async {
    recordPath = 'recorded_sound.mp4';
    await recorderModule.openRecorder();
    await recorderModule.setSubscriptionDuration(const Duration(milliseconds: 10));
    await initializeDateFormatting();
    await askPermission();
  }

  Future<void> askPermission() async {
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  void recordingStart() async {
    setState(() {
      minutesStr = '00';
      secondsStr = '00';
    });
    await recorderModule.startRecorder(
      toFile: recordPath,
      codec: Codec.aacMP4,
    );
    timerStream = stopWatchStream();
    timerSubscription = timerStream!.listen((int newTick) {
      setState(() {
        minutesStr = ((newTick / 60) % 60).floor().toString().padLeft(2, '0');
        secondsStr = (newTick % 60).floor().toString().padLeft(2, '0');
      });
    });
  }

  void recordingStop() async {
    timerStream = stopWatchStream();
    timerSubscription!.cancel();
    timerStream = null;
    await recorderModule.stopRecorder();
    String audioPath = (await recorderModule.getRecordURL(path: recordPath)).toString();
    File audioFile = await AudioService.get(audioPath);
    widget.setAudio(audioFile);
  }

  Stream<int> stopWatchStream() {
    StreamController<int>? streamController;
    Timer? timer;
    Duration timerInterval = const Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer!.cancel();
        timer = null;
        counter = 0;
        streamController!.close();
      }
    }

    void tick(_) {
      counter++;
      streamController!.add(counter);
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  void initState() {
    super.initState();
    initSettings();
  }

  @override
  void dispose() {
    super.dispose();
    if (recorderModule.isRecording) {
      recordingStop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              isRecording ? recordingStop() : recordingStart();
              setState(() {
                isRecording = !isRecording;
              });
            },
            icon: FaIcon(
              isRecording ? FontAwesomeIcons.circleStop : FontAwesomeIcons.circleDot,
              size: 35.r,
              color: AppColors.darkGrean,
            ),
          ),
          Text(
            '$minutesStr:$secondsStr',
            style: TextStyle(color: AppColors.darkGrean, fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
