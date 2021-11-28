import 'package:app_chua/model/resource/resource_model.dart';

class AudioTrack {
  static List<ResourceModel>? resources;
  static setAudios(audios) {
    resources = audios;
  }

  static ResourceModel next({currentTrackIndex = 0}) {
    return resources![currentTrackIndex + 1];
  }

  static ResourceModel previous({currentTrackIndex = 0}) {
    return resources![currentTrackIndex - 1];
  }
}
