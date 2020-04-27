import 'package:flutter/material.dart';

class CurrentVolumeProvider extends ChangeNotifier {
  double _volume = 0.0;

  double get currentVolume => _volume;

  void setVolume(double value) {
    _volume = value;
    notifyListeners();
  }
}
