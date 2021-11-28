import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/audio/audio_model.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/audio_player_widget.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/description_widget.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioDetailPage extends StatefulWidget {
  final String title;
  final ResourceModel audio;
  AudioDetailPage({this.title = 'NGÀI VIÊN MINH', required this.audio});
  @override
  _AudioDetailPageState createState() => _AudioDetailPageState();
}

class _AudioDetailPageState extends State<AudioDetailPage> {
  final _audioService = locator<AudioPlayerService>();
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return ProviderWidget<AudioPlayerService>(
      model: _audioService,
      onModelReady: (model) async {
        if (model.audioTrack != null && model.isPlay == true)
          await model.stop();
        model.setAudioSource(widget.audio);
        //await model.play(resource: widget.audio);
      },
      builder: (context, model, _) => Scaffold(
        bottomNavigationBar: Container(
          height: 150,
          width: appWidth,
          margin: EdgeInsets.only(bottom: 30),
          child: model.loading == true ? Container() : AudioPlayerWidget(),
        ),
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            backgroundColor: AppColors.white,
            leading: CupertinoNavigationBarBackButton(
              color: AppColors.orange,
              onPressed: () => Navigator.of(context).pop(),
            ),
            middle: Text(
              widget.title,
              style: TextStyle(
                  color: AppColors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.wrap_text),
          ),
          child: Container(
            height: appHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: appWidth,
                    color: AppColors.white,
                  ),
                  Container(
                    height: appHeight,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            child: Container(
                              height: appHeight,
                              width: appWidth,
                              color: AppColors.orange,
                            )),
                        Positioned(
                          top: 30,
                          child: Container(
                            height: appHeight,
                            width: appWidth,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  indent: appWidth * 0.41,
                                  endIndent: appWidth * 0.41,
                                  thickness: 4,
                                  color: AppColors.grey.withOpacity(0.4),
                                ),
                                SizedBox(
                                  height: 20 + 10.0,
                                ),
                                Container(
                                  height: appHeight * 0.28,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 15.0,
                                            offset: Offset(0.0, 6))
                                      ],
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/background/account_page.png'),
                                          fit: BoxFit.cover)),
                                ),
                                Expanded(
                                  child: DescriptionWidget(
                                      height: appHeight * 0.6,
                                      resource:
                                          model.audioTrack ?? widget.audio),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
