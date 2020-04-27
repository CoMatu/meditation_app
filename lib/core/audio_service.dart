import 'package:audioplayers/audioplayers.dart';

abstract class MainAudioService {
  Future<AudioPlayer> playAudio(String localPath);

  Future<void> pauseAudio(AudioPlayer player);

  Future<void> stopAudio(AudioPlayer player);

  Future<void> resumeAudio(AudioPlayer player);
}
