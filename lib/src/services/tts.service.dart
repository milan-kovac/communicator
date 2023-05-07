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
      await ftts.setSpeechRate(0.6);
      await ftts.setVolume(1);
      await ftts.setPitch(1);
      await ftts.speak(text);
    } catch (e) {
      log(e.toString());
    }
  }

  Future initTts() async {
    await ftts.awaitSpeakCompletion(true);
    if (await ftts.isLanguageAvailable('sr')) {
      await ftts.setLanguage("sr");
      await ftts.setVoice({'name': 'sr', 'locale': 'sr'});
    } else {
      await ftts.setLanguage("en-Us");
    }
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
