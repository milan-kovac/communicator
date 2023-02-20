import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Player extends StatefulWidget {
  final String uri;
  const Player({super.key, required this.uri});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  FlutterSoundPlayer player = FlutterSoundPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    player.openPlayer();
    super.initState();
  }

  @override
  void dispose() {
    if (player.isPlaying) {
      player.closePlayer();
    }
    super.dispose();
  }

  void playStop() {
    setIsPlaying();
    if (isPlaying) {
      player.stopPlayer();
    } else {
      player.startPlayer(
          fromURI:widget.uri,
          codec: Codec.aacMP4,
          whenFinished: () => setIsPlaying());
    }
  }

  void setIsPlaying() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: playStop,
      child: FaIcon(
        isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
        color: AppColors.fadedBlack,
      ),
    );
  }
}
