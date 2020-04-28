import 'package:flutter/material.dart';

class DurationProvider extends ChangeNotifier {
  int _duration = 0;

  int get duration => _duration;

  void setDuration(int duration) {
    _duration = duration;
    notifyListeners();
  }
}
