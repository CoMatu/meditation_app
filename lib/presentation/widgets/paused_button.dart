import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/providers/bottom_panel_provider.dart';
import 'package:provider/provider.dart';

class PausedButtonPanel extends StatelessWidget {
  const PausedButtonPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 135.0,
          height: 42.0,
          child: OutlineButton(
            onPressed: () {
              Provider.of<BottomPanelProvider>(context, listen: false)
                  .changePanelState();
            },
            child: Text(
              'Pause',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(7.0),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
