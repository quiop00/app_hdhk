import 'package:app_chua/enums/resource_type.dart';
import 'package:app_chua/model/audio/audio_track.dart';
import 'package:app_chua/model/resource/resource_model.dart';
import 'package:app_chua/provider/view_state_model.dart';
import 'package:app_chua/services/audio_player/audio_track.dart' as track;
import 'package:audio_service/audio_service.dart';
import 'package:flutter/animation.dart';
import 'package:video_player/video_player.dart';

import 'audio_player_task.dart';

void _entryPoint() {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class AudioPlayerService extends ViewStateModel {
  ResourceModel? _audioTrack;
  double? speed;
  bool? isPlay = false;
  bool? isStop = true;
  bool? isVisible = false;
  bool? isAudio = true;
  bool? loading = false;
  Duration? position;
  Duration? duration;
  List<ResourceModel>? audios;
  int? currentIndex;
  late AnimationController animationController;
  late VideoPlayerController videoController;
  setAudio(audios, {currentIndex = 0}) async {
    this.audios = audios;
    this.currentIndex = currentIndex;
    this.duration = Duration();
    this.position = Duration();
    print(this.audios!.length);
  }

  get audioTrack => this._audioTrack;
  setAudioSource(source) {
    this._audioTrack = source;
    if (source.type == ResourceType.VIDEO) isAudio = false;
    notifyListeners();
  }

  static Future<void> _startAudioService(
    AudioPlayerService mediaPlayer,
  ) async {
    AudioService.customEventStream.listen((event) {
      if (event[AudioPlayerTask.DURATION_SECONDS_EVENT] != null) {
        mediaPlayer.changDuration(
            Duration(seconds: event[AudioPlayerTask.DURATION_SECONDS_EVENT]));
      }
      if (event[AudioPlayerTask.POSITION_SECONDS_EVENT] != null) {
        mediaPlayer.setPosition(
            Duration(seconds: event[AudioPlayerTask.POSITION_SECONDS_EVENT]));
      }
      if (event[AudioPlayerTask.COMPLETE_EVENT] != null) {
        mediaPlayer.nextTrack();
      }
      if (event[AudioPlayerTask.PLAY_EVENT] != null) {
        if (mediaPlayer.isAudio == true)
          mediaPlayer.resume();
        else
          mediaPlayer.playVideo();
      }
      if (event[AudioPlayerTask.PAUSE_EVENT] != null) {
        if (mediaPlayer.isAudio == true)
          mediaPlayer.pause();
        else
          mediaPlayer.pauseVideo();
      }
      if (event[AudioPlayerTask.SKIP_TO_PREVIOUS_EVENT] != null) {
        mediaPlayer.prevTrack();
      }
      if (event[AudioPlayerTask.SKIP_TO_NEXT_EVENT] != null) {
        mediaPlayer.nextTrack();
      }
      if (event[AudioPlayerTask.STOP_EVENT] != null) {
        mediaPlayer.stopFromIsolate();
      }
    });
    await AudioService.connect();
    await AudioService.start(backgroundTaskEntrypoint: _entryPoint)
        .then((value) =>
            print('==== successStartBackgroundTask ====>' + value.toString()))
        .onError((error, stackTrace) => print(
            '----- successStartBackgroundTask error ----: ' +
                error.toString()));
  }

  void _addTrackAndPlay(ResourceModel track) {
    AudioService.updateQueue([]);
    AudioService.addQueueItem(MediaItem(
      id: track.url!,
      title: track.title!,
      album: track.author!,
    ));

    AudioService.customAction(AudioPlayerTask.PLAY_ACTION, 1);

    print("addTrack");
  }

  Future<dynamic> _addActionToAudioService(Function callback) async {
    if (!AudioService.running) {
      await _startAudioService(this);
    }
    print("init");
    return callback();
  }

  Future<void> initVideo(video) async {
    this._audioTrack = video;
    isAudio = false;
    loading = true;
    videoController = VideoPlayerController.network(_audioTrack!.url!);
    await videoController.initialize();
    videoController.play();
    isPlay = true;
    loading = false;
    notifyListeners();
  }

  Future<void> play({resource, index = 0}) async {
    //_audioTrack = null;

    if (_audioTrack == null) {
      _audioTrack = resource;
      if (resource == null) _audioTrack = this.audios![index];

      if (_audioTrack is ResourceModel) {
        _addActionToAudioService(() => _addTrackAndPlay(_audioTrack!));
      } else {}
    } else {
      _addActionToAudioService(
          () => AudioService.customAction(AudioPlayerTask.RESUME_ACTION));
    }
    if (isVisible != true) animationController.forward();
    _audioTrack = _audioTrack;
    isPlay = true;
    isStop = false;
    isVisible = true;
    notifyListeners();
  }

  Future<void> playVideo({resource}) async {
    if (_audioTrack == null) {
      _audioTrack = resource;
      if (_audioTrack is ResourceModel) {
        _addActionToAudioService(() => _addTrackAndPlay(_audioTrack!));
      } else {}
    } else {
      _addActionToAudioService(
          () => AudioService.customAction(AudioPlayerTask.RESUME_ACTION));
    }
    videoController.play();
    isPlay = true;
    notifyListeners();
  }

  Future<void> pauseVideo() async {
    isPlay = false;
    _addActionToAudioService(() => AudioService.pause());
    videoController.pause();
    notifyListeners();
  }

  Future<void> pause() async {
    isPlay = false;
    _addActionToAudioService(() => AudioService.pause());
    if (isAudio == false) {
      await videoController.pause();
    }
    notifyListeners();
  }

  Future<void> resume() async {
    isPlay = true;
    _addActionToAudioService(
        () => AudioService.customAction(AudioPlayerTask.RESUME_ACTION));
    notifyListeners();
  }

  Future<void> stop() async {
    isPlay = false;
    _addActionToAudioService(
        () => AudioService.stop().then((value) => print('**** stop stop ***')));
    isStop = true;
    isVisible = false;
    duration = new Duration();
    position = new Duration();
    notifyListeners();
  }

  // Future<void> toggleEarpieceOrSpeakers() async {
  //   if (await _addActionToAudioService(() =>
  //       AudioService.customAction(AudioPlayerTask.EARPIECE_TOGGLE_ACTION))) {}
  // }

  Future<void> seek(Duration newPosition) async {
    if (newPosition.inSeconds > 0) {
      newPosition = newPosition;
    }
    position = newPosition;
    _addActionToAudioService(() => AudioService.customAction(
        AudioPlayerTask.SEEK_ACTION, newPosition.inSeconds));
    notifyListeners();
  }

  Future<void> nextTrack() async {
    if (_audioTrack is ResourceModel) {
      var nextTrack = this._next(
        currentTrackIndex: _audioTrack!.currentTrackIndex,
      );
      if (nextTrack is ResourceModel) {
        _audioTrack = nextTrack;
        isPlay = true;
        _addActionToAudioService(() => _addTrackAndPlay(nextTrack));
      } else {}
    }
    notifyListeners();
  }

  Future<void> prevTrack() async {
    if (_audioTrack is ResourceModel) {
      var prevTrack = this._previous(
        _audioTrack!.currentTrackIndex,
      );

      if (prevTrack is ResourceModel) {
        _audioTrack = prevTrack;
        isPlay = true;
        _addTrackAndPlay(prevTrack);
      } else {}
    }
    notifyListeners();
  }

  Future<void> stopFromIsolate() async {
    _audioTrack = null;
    isStop = true;
    notifyListeners();
  }

  Future<void> changDuration(Duration duration) async {
    this.duration = duration;

    notifyListeners();
  }

  Future<void> setPosition(Duration position) async {
    this.position = position;
    notifyListeners();
  }

  _next({currentTrackIndex = 0}) {
    if (this.audios!.length >= currentTrackIndex + 1)
      return this.audios![++currentTrackIndex];
  }

  _previous(int? currentTrackIndex) {
    if (currentTrackIndex! > 0) return this.audios![--currentTrackIndex];
  }
}
