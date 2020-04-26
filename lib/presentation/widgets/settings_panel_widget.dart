import 'package:flutter/material.dart';

class SettingPanelWidget extends StatefulWidget {
  const SettingPanelWidget({Key key}) : super(key: key);

  @override
  _SettingPanelWidgetState createState() => _SettingPanelWidgetState();
}

class _SettingPanelWidgetState extends State<SettingPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            height: 20.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'VOLUME',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ),
        Container(
          height: 70.0,
          child: SliderTheme(
            //TODO добавить картинку в ползунок слайдера
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white38,
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 2.0,
              thumbColor: Colors.white,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18.0),
              overlayColor: Colors.white.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              min: 0,
              max: 100,
              value: 50,
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        Container(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'SOUND',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('res/images/background_1.png'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
