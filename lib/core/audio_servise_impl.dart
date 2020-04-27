import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:meditation_app/core/audio_service.dart';
import 'package:meta/meta.dart';

class MainAudioServiceImpl implements MainAudioService {
  final AudioCache audioCache;

  MainAudioServiceImpl({@required this.audioCache});

  @override
  Future<AudioPlayer> playAudio(String localPath) async {
    final AudioPlayer player = await audioCache.play(localPath);
    return player;
  }

  @override
  Future<void> pauseAudio(AudioPlayer player) async {
    await player.pause();
  }

  @override
  Future<void> resumeAudio(AudioPlayer player) async {
    await player.resume();
  }

  @override
  Future<void> stopAudio(AudioPlayer player) async {
    await player.stop();
  }

  @override
  Future<int> getDuration(AudioPlayer player) async {
    int duration = await Future.delayed(
        Duration(milliseconds: 500), () => player.getDuration());
    return duration;
  }
}
