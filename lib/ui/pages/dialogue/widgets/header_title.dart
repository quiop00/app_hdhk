import 'package:app_chua/provider/provider_widget.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final AudioPlayerService model;
  HeaderTitle({required this.model});
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AudioPlayerService>(
      model: model,
      builder: (context, model, __) => model.audioTrack == null
          ? Visibility(
              child: Container(),
              visible: false,
            )
          : Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: AppColors.orange,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage:
                          AssetImage('assets/background/account_page.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    model.audioTrack!.title ?? "",
                    style: TextStyle(color: AppColors.white),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.share,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
