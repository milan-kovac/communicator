import 'package:communicator/src/utils/app.color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
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

  Future<void> playStop() async {
    if (isPlaying) {
      await player.stopPlayer();
      setIsPlaying();
    } else {
      setIsPlaying();
      await player.setVolume(1);
      await player.startPlayer(
          fromURI: widget.uri,
          codec: Codec.aacMP4,
          whenFinished: () {
            setIsPlaying();
            player.stopPlayer();
          });
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
      onTap: () async => await playStop(),
      child: FaIcon(
        isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
        color: AppColors.fadedBlack,
        size: 35.r,
      ),
    );
  }
}
