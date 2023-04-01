import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
  late FlutterTts ftts;
  final String text;
  TtsService({required this.text}) {
    ftts = FlutterTts();
  }

  Future startSpeech() async {
    print(ftts);
    try {
      print('start');
      print(text);
      await ftts.awaitSpeakCompletion(true);
      await ftts.setLanguage("en-US");
      await ftts.setSpeechRate(1);
      await ftts.setVolume(1.0);
      await ftts.setPitch(1);
      var result = await ftts.speak("Hello World, this is Flutter Campus.");
      print(result);
      print('kraj');
    } catch (e) {
      print('ERROR');
      print(e);
    }
  }
}
