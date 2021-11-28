import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/ui/pages/dialogue/audio_detail_page.dart';
import 'package:app_chua/ui/widgets/skeleton.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/dialogues_view_model.dart';
import 'package:app_chua/view_model/list_monk_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioElements extends StatefulWidget {
  final double height;
  final bool hasPlayerButton;
  AudioElements({required this.height, this.hasPlayerButton = true});
  @override
  State<StatefulWidget> createState() {
    return _AudioElements();
  }
}

class _AudioElements extends State<AudioElements>
    with AutomaticKeepAliveClientMixin<AudioElements> {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: ProviderWidget<ListDialogueViewModel>(
        model: ListDialogueViewModel(),
        onModelReady: (model) async {
          await model.fetchAudio();
        },
        builder: (context, model, child) => model.isLoading
            ? SkeletonList(
                item: Container(
                  height: 90.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: AppColors.grey,
                        width: MediaQuery.of(context).size.width - 20,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                children: [
                                  widget.hasPlayerButton
                                      ? Container(
                                          height: 20,
                                          width: 20,
                                        )
                                      : Container(
                                          height: 40,
                                          width: 40,
                                        ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 30,
                                      ),
                                      Container(
                                        width: 100,
                                        height: 30,
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: model.audio!.length,
                itemBuilder: (context, index) => AudioElement(
                    hasPlayerButton: widget.hasPlayerButton,
                    index: index,
                    model: model.audio![index])),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class AudioElement extends StatefulWidget {
  final bool hasPlayerButton;
  final index;
  final ResourceModel model;
  final _audioService = locator<AudioPlayerService>();
  AudioElement(
      {required this.model, required this.hasPlayerButton, this.index});
  @override
  State<StatefulWidget> createState() {
    return _AudioElement();
  }
}

class _AudioElement extends State<AudioElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget.hasPlayerButton) {
          Provider.of<ListDialogueViewModel>(context, listen: false)
              .play(widget.index);
          widget._audioService.play(resource: widget.model);
        } else {
          // if(widget._audioService.isPlay==true)
          //   await widget._audioService.stop();
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => AudioDetailPage(
                    audio: widget.model,
                  )));
        }
      },
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 6),
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: AppColors.orange.withOpacity(
                    Provider.of<ListDialogueViewModel>(context).selected ==
                            widget.index
                        ? 0.4
                        : 0),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        children: [
                          widget.hasPlayerButton
                              ? Icon(
                                  Icons.play_arrow_outlined,
                                  color: widget.index ==
                                          Provider.of<ListDialogueViewModel>(
                                                  context)
                                              .selected
                                      ? AppColors.blue
                                      : AppColors.black,
                                )
                              : Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/background/account_page.png'),
                                          fit: BoxFit.cover)),
                                ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.model.title ?? "Title trống",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Provider.of<ListDialogueViewModel>(
                                                    context)
                                                .selected ==
                                            widget.index
                                        ? AppColors.white
                                        : AppColors.black),
                              ),
                              Text('21/01/2020',
                                  style: TextStyle(
                                      color: Provider.of<ListDialogueViewModel>(
                                                      context)
                                                  .selected ==
                                              widget.index
                                          ? AppColors.white
                                          : AppColors.black))
                            ],
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            widget.model.bookmark != null &&
                                    widget.model.bookmark == true
                                ? Icon(
                                    Icons.bookmark_outlined,
                                    color: AppColors.orange,
                                  )
                                : Icon(Icons.bookmark_border_sharp),
                            Text('30:00',
                                style: TextStyle(
                                    color: Provider.of<ListDialogueViewModel>(
                                                    context)
                                                .selected ==
                                            widget.index
                                        ? AppColors.white
                                        : AppColors.black))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
