import 'package:app_chua/services/audio_player/audio_player_service.dart';
import 'package:app_chua/services/locator.dart';
import 'package:app_chua/view_model/account_view_model.dart';
import 'package:app_chua/view_model/device.dart';
import 'package:app_chua/view_model/favourite.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => AccountViewModel()),
  ChangeNotifierProvider(create: (context) => FavouriteStateModel()),
  ChangeNotifierProvider(create: (context) => Device()),
  ChangeNotifierProvider.value(value: locator<AudioPlayerService>())
];
