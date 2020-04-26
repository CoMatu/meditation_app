import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/providers/bottom_panel_provider.dart';
import 'package:provider/provider.dart';

class ResumeButtonPanel extends StatelessWidget {
  const ResumeButtonPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 135.0,
          height: 42.0,
          child: OutlineButton(
            onPressed: () {
              Navigator.pop(context);
              Provider.of<BottomPanelProvider>(context, listen: false)
                  .changePanelState();
            },
            child: Text(
              'Stop',
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
        Container(
          width: 135.0,
          height: 42.0,
          child: RaisedButton(
            onPressed: () {
              Provider.of<BottomPanelProvider>(context, listen: false)
                  .changePanelState();
            },
            child: Text(
              'Resume',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(7.0),
            ),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
