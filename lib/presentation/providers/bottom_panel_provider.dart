import 'package:flutter/material.dart';

class BottomPanelProvider extends ChangeNotifier {
  bool _panelState = true;

  bool get panelState => _panelState;

  void changePanelState() {
    _panelState = !_panelState;
    notifyListeners();
  }
}
