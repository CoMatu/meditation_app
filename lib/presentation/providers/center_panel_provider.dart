import 'package:flutter/material.dart';

class CenterPanelProvider extends ChangeNotifier {
  bool _panelState = true;

  bool get panelState => _panelState;

  void changePanelState() {
    _panelState = !_panelState;
    notifyListeners();
  }
}
