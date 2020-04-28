import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerProvider extends ChangeNotifier {
  AudioPlayer _audioPlayer;

  AudioPlayer get audioPlayer => _audioPlayer;

  void setAudioPlayer(AudioPlayer player) {
    _audioPlayer = player;
    notifyListeners();
  }

  void resetPlayer() {
    _audioPlayer = null;
    notifyListeners();
  }
}
