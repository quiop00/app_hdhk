import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/header_title.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:app_chua/config/data.dart' as data;

class AudioPlayerWidget extends StatefulWidget {
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget>
    with TickerProviderStateMixin {
  final _audioService = locator<AudioPlayerService>();
  AnimationController? _animationIconController1;

  @override
  void initState() {
    _animationIconController1 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 750),
        reverseDuration: Duration(milliseconds: 750),
        value: _audioService.isPlay == true ? 1.0 : 0.0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ProviderWidget<AudioPlayerService>(
      model: _audioService,
      builder: (context, model, child) => Container(
          color: AppColors.white,
          height: 140,
          child: Column(
            children: [
              HeaderTitle(
                model: model,
              ),
              Container(
                height: 100,
                child: Stack(
                  children: [
                    Container(
                      height: 90,
                      padding: EdgeInsets.only(top: 5, left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("10:00"))),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text("30:00")))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          Icons.autorenew,
                                          color: AppColors.orange,
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: model.currentIndex == 0
                                                ? null
                                                : () {
                                                    model.prevTrack();
                                                  },
                                            child: Icon(Icons.skip_previous,
                                                color: model.currentIndex == 0
                                                    ? AppColors.grey
                                                    : AppColors.orange),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              if (model.isPlay == false) {
                                                _animationIconController1!
                                                    .forward();
                                                model.play();
                                              } else {
                                                _animationIconController1!
                                                    .reverse();
                                                model.pause();
                                              }
                                            },
                                            child: ClipOval(
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                color: AppColors.orange,
                                                child: Center(
                                                  child: AnimatedIcon(
                                                      size: 25,
                                                      color: AppColors.white,
                                                      icon: AnimatedIcons
                                                          .play_pause,
                                                      progress:
                                                          _animationIconController1!),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              model.nextTrack();
                                            },
                                            child: Icon(Icons.skip_next,
                                                color: AppColors.orange),
                                          )
                                        ],
                                      ),
                                    )),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.volume_up,
                                            color: AppColors.orange)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        child: SliderTheme(
                          data: SliderThemeData(
                              thumbColor: AppColors.white,
                              activeTrackColor: AppColors.orange,
                              trackShape: CustomTrackShape(trackWidth: width)),
                          child: Slider(
                            inactiveColor: Colors.red,
                            value: model.position != null
                                ? model.position!.inSeconds + 0
                                : 0,
                            max: model.duration != null
                                ? model.duration!.inSeconds + 1
                                : 0,
                            min: 0,
                            onChanged: (double value) {
                              model.seek(Duration(milliseconds: value.ceil()));
                            },
                          ),
                        )),
                  ],
                ),
              ),
            ],
          )),
    );
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
    final double trackTop = 0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
