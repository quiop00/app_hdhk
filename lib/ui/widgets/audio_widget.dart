import 'package:app_chua/utils/color.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioWidget extends StatefulWidget {
  final String urlAudio;
  final sliderWidth;
  AudioWidget({required this.urlAudio, this.sliderWidth});
  @override
  State<StatefulWidget> createState() {
    return _AudioWidget();
  }
}

AnimationController? _animationIconController1;
AudioCache? audioCache;
AudioPlayer? audioPlayer;
Duration _duration = new Duration();
Duration _position = new Duration();
Duration _slider = new Duration(seconds: 0);
double? durationvalue;
bool issongplaying = false;
Duration? totalDuration;

class _AudioWidget extends State<AudioWidget> with TickerProviderStateMixin {
  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer!.seek(newDuration);
  }

  @override
  void initState() {
    _position = _slider;
    _animationIconController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
      reverseDuration: Duration(milliseconds: 750),
    );
    audioPlayer = new AudioPlayer();
    //audioCache = new AudioCache(fixedPlayer: audioPlayer);
    audioPlayer!.onDurationChanged.listen((d) {
      print(d);
      setState(() {
        _duration = d;
      });
      totalDuration = d;
    });
    audioPlayer!.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    //audioPlayer.c
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Stack(
          children: [
            Row(children: [
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (!issongplaying) {
                        //audioCache.play(widget.urlAudio);
                        audioPlayer!.play(widget.urlAudio);
                      } else {
                        audioPlayer!.pause();
                      }
                      issongplaying
                          ? _animationIconController1!.reverse()
                          : _animationIconController1!.forward();
                      issongplaying = !issongplaying;
                    },
                  );
                },
                child: ClipOval(
                    child: Container(
                        height: 50,
                        width: 50,
                        color: AppColors.orange,
                        child: Center(
                          child: AnimatedIcon(
                              size: 25,
                              color: AppColors.white,
                              icon: AnimatedIcons.play_pause,
                              progress: _animationIconController1!),
                        ))),
              ),
              SliderTheme(
                data: SliderThemeData(
                    thumbColor: AppColors.white,
                    activeTrackColor: AppColors.orange,
                    trackShape:
                        CustomTrackShape(trackWidth: widget.sliderWidth)),
                child: Slider(
                  inactiveColor: Colors.red,
                  value: _position.inSeconds.toDouble(),
                  max: _duration.inSeconds.toDouble() + 2,
                  onChanged: (double value) {
                    setState(() {
                      seekToSecond(value.toInt());
                      value = value;
                    });
                  },
                ),
              )
            ]),
            Positioned(
                top: 0,
                right: 10,
                child: Text((_position == null
                        ? '00:00'
                        : ('${_position.inMinutes}:${_position.inSeconds}')) +
                    '/' +
                    (totalDuration == null
                        ? '00:00'
                        : totalDuration.toString().split('.')[0])))
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
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
