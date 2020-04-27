import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:meditation_app/core/audio_service.dart';
import 'package:meditation_app/core/audio_servise_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AudioPlayer());
  sl.registerFactory(() => AudioCache());
  sl.registerLazySingleton<MainAudioService>(
      () => MainAudioServiceImpl(audioCache: sl()));
}
