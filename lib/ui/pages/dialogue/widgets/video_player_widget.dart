import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final ResourceModel video;
  VideoPlayerWidget({required this.video});
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with TickerProviderStateMixin {
  final _mediaService = locator<AudioPlayerService>();
  AnimationController? _animationIconController1;
  late VideoPlayerController videoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationIconController1 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 750),
        reverseDuration: Duration(milliseconds: 750),
        value: _mediaService.isPlay == true ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return ProviderWidget<AudioPlayerService>(
        model: _mediaService,
        onModelReady: (model) {
          model.initVideo(widget.video);
          if (model.position != null)
            model.videoController.seekTo(model.position!);
        },
        builder: (context, model, _) => model.loading != true
            ? Container(
                height: appHeight * 0.3,
                width: appWidth,
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: model.videoController.value.aspectRatio,
                      child: VideoPlayer(model.videoController),
                    ),
                    Positioned(
                        width: appWidth,
                        height: appHeight * 0.3,
                        child: Center(
                          child: InkWell(
                            onTap: () async {
                              if (model.isPlay != true) {
                                _animationIconController1!.forward();
                                model.playVideo();
                              } else {
                                _animationIconController1!.reverse();
                                model.pauseVideo();
                              }
                            },
                            child: AnimatedOpacity(
                              duration: const Duration(seconds: 1),
                              opacity: model.isPlay == false ? 1 : 0,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.orange,
                                child: Center(
                                    child: AnimatedIcon(
                                  progress: _animationIconController1!,
                                  icon: AnimatedIcons.play_pause,
                                )),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              )
            : Container(
                height: appHeight * 0.3,
                child: Center(child: CircularProgressIndicator()),
              ));
  }
}
