import 'package:app_chua/network/api.dart';
import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:get_it/get_it.dart';

import 'local_storage.dart';

GetIt locator = GetIt.instance;
void setupLocator() async {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AudioPlayerService());
  PreferenceUtils.init();
}
