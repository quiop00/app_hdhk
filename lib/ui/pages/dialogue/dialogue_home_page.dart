import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/audio_player_widget.dart';
import 'package:app_chua/ui/pages/dialogue/widgets/tab_view.dart';
import 'package:app_chua/ui/widgets/monk_builder.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialoguePage extends StatefulWidget {
  @override
  _DialoguePageState createState() => _DialoguePageState();
}

class _DialoguePageState extends State<DialoguePage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    final _audioService = locator<AudioPlayerService>();
    return Scaffold(
      bottomNavigationBar: ProviderWidget<AudioPlayerService>(
        model: _audioService,
        onModelReady: (model) {
          model.animationController = _animationController;
        },
        builder: (context, model, child) =>
            (model.isVisible == false || model.isAudio != true)
                ? Visibility(visible: false, child: Container())
                : SizeTransition(
                    sizeFactor: CurvedAnimation(
                      curve: Curves.fastOutSlowIn,
                      parent: model.animationController,
                    ),
                    child: Container(
                      height: 150,
                      width: appWidth,
                      margin: EdgeInsets.only(bottom: 30),
                      child: AudioPlayerWidget(),
                    ),
                  ),
      ),
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
              color: AppColors.orange,
              onPressed: () {
                context.read<Pop>().onBack();
              }),
          middle: Text(
            'PHÁP THOẠI',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(onTap: () {}, child: Icon(Icons.wrap_text)),
        ),
        child: Container(
          height: appHeight - 80,
          color: AppColors.white,
          child: Column(
            children: [
              MonkBuilder(
                appHeight: appHeight,
                appWidth: appWidth,
                onTap: () {},
              ),
              Expanded(
                child: TabViewContent(appHeight: appHeight),
              )
            ],
          ),
        ),
      ),
    );
  }
}
