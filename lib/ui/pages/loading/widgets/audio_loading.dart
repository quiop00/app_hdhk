import 'package:app_chua/utils/color.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioLoading extends StatefulWidget {
  final String urlAudio;
  final width;
  final onCompleted;
  AudioLoading({required this.urlAudio, required this.onCompleted, this.width});
  @override
  State<StatefulWidget> createState() {
    return _AudioLoading();
  }
}

late AudioPlayer audioPlayer;
Duration _duration = new Duration();
Duration _position = new Duration(seconds: 0);
Duration _slider = new Duration(seconds: 0);
late double durationValue;
bool issongplaying = false;
Duration totalDuration = Duration(seconds: 10);
AudioCache audioCache = AudioCache();

class _AudioLoading extends State<AudioLoading> {
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  @override
  void initState() {
    _position = _slider;
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onDurationChanged.listen((d) {
      print(d);
      setState(() {
        _duration = d;
      });
      totalDuration = d;
    });
    audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    //audioPlayer.play(widget.urlAudio, isLocal: true);
    audioPlayer.onPlayerCompletion.listen((event) {
      widget.onCompleted();
    });
    audioCache.play(widget.urlAudio);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 50,
              width: widget.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () async {
                        await audioPlayer.stop();
                        widget.onCompleted();
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Center(
              child: Container(
                width: widget.width,
                height: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: LinearProgressIndicator(
                      value: _position.inSeconds / totalDuration.inSeconds,
                      backgroundColor: AppColors.grey,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.orange),
                    )),
              ),
            ),
          ],
        ));
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  final double trackWidth;
  CustomTrackShape({required this.trackWidth});
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = 1;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight - 10) / 2;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
