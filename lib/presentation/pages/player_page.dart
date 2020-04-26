import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/presentation/widgets/widgets.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with TickerProviderStateMixin {
  AnimationController progressController;
  AnimationController progressInnerController;
  Animation animation;
  Animation animationInner;

  bool _visible;

  @override
  void initState() {
    super.initState();
    _visible = false;
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    progressInnerController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 0.0, end: 30.0).animate(progressController);
    animationInner =
        Tween(begin: 0.0, end: 100.0).animate(progressInnerController);

    animation.addListener(() {
      setState(() {});
    });

    animationInner.addListener(() {
      setState(() {
        _visible = true;
      });
    });
    progressInnerController.forward();
    progressController.forward();
  }

  @override
  void dispose() {
    progressController.dispose();
    progressInnerController.dispose();
    super.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                  ],
                ),
                Column(
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
                            Center(
                              child: CustomPaint(
                                foregroundPainter: CircleProgress(
                                    animation.value, animationInner.value),
                                child: Container(
                                  height: 230.0,
                                  width: 230.0,
                                ),
                              ),
                            ),
                            //TODO сделать индикатор времени
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '03:59',
                                      style: TextStyle(
                                          fontSize: 34.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
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
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 135.0,
                          height: 42.0,
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text(
                              'Pause',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(7.0),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 58.0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
