import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  late FlutterTts ftts;
  final String text;
  TtsService({required this.text}) {
    ftts = FlutterTts();
  }

  Future startSpeech() async {
    try {
      await initTts();
      await ftts.setLanguage("sr");
      await ftts.setSpeechRate(0.6);
      await ftts.setVolume(1);
      await ftts.setPitch(1);
      await ftts.setVoice({'name': 'sr', 'locale': 'sr'});
      await ftts.awaitSpeakCompletion(true);
      await ftts.speak(text);
    } catch (e) {
      log(e.toString());
    }
  }

  Future initTts() async {
    ftts.setStartHandler(() {
      log("Playing");
    });

    ftts.setInitHandler(() {
      log("TTS Initialized");
    });

    ftts.setCompletionHandler(() {
      log("Complete");
    });

    ftts.setCancelHandler(() {
      log("Cancel");
    });

    ftts.setPauseHandler(() {
      log("Paused");
    });

    ftts.setContinueHandler(() {
      log("Continued");
    });

    ftts.setErrorHandler((msg) {
      log("error: $msg");
    });
  }
}
