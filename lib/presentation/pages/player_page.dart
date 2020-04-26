import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('res/images/background_player.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              children: <Widget>[
                Container(height: 44.0),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                      Row(children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 45.0,
                            child: Image.asset('res/images/sound-thin.png'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 45.0,
                            child: Image.asset('res/images/settings.png'),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Title Title',
                        style: TextStyle(
                            fontSize: 34.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                      Container(
                        height: 230.0,
                        width: 230.0,
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              //TODO сделать индикатор времени
                              Column(
                                children: <Widget>[
                                  Text(
                                    '03:59',
                                    style: TextStyle(
                                        fontSize: 34.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    'Day 1',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
