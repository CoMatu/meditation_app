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
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: new AssetImage('res/images/picture_ocean.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 4.0,
                    ),
                    Text(
                      'Ocean',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: new AssetImage('res/images/picture_cafe.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 4.0,
                    ),
                    Text(
                      'Cafe',
                      style: TextStyle(color: Colors.white38, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: new AssetImage('res/images/picture_airport.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 4.0,
                    ),
                    Text(
                      'Airport',
                      style: TextStyle(color: Colors.white38, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: new AssetImage('res/images/picture_piano.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 4.0,
                    ),
                    Text(
                      'Piano',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: new AssetImage('res/images/picture_storm.png'),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(20.0)),
                        border: new Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 4.0,
                    ),
                    Text(
                      'Storm',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
