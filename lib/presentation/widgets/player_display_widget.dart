import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/widgets/widgets.dart';

class PlayerDisplayWidget extends StatefulWidget {
  const PlayerDisplayWidget({
    Key key,
    @required this.audioPlayer,
    @required this.duration,
  }) : super(key: key);

  final AudioPlayer audioPlayer;
  final int duration;

  @override
  _PlayerDisplayWidgetState createState() => _PlayerDisplayWidgetState();
}

class _PlayerDisplayWidgetState extends State<PlayerDisplayWidget>
    with TickerProviderStateMixin {
  AnimationController progressController;
  AnimationController progressInnerController;
  Animation animation;
  Animation animationInner;
  double _soundProgress = 0.0;

  void initState() {
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    progressInnerController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation =
        Tween(begin: 0.0, end: _soundProgress).animate(progressController);
    animationInner =
        Tween(begin: 0.0, end: 100.0).animate(progressInnerController);

    animation.addListener(() {
      setState(() {});
    });

    animationInner.addListener(() {
      setState(() {});
    });

    widget.audioPlayer.onAudioPositionChanged.listen((Duration p) => {
          if (mounted)
            {
              setState(() {
                if (p.inMilliseconds != 0) {
                  _soundProgress = p.inMilliseconds * 100 / widget.duration;
                  animation = Tween(begin: 0.0, end: _soundProgress)
                      .animate(progressController);
                }
              })
            }
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
    return Column(
      children: <Widget>[
        Text(
          'Title Title',
          style: TextStyle(
              fontSize: 34.0, color: Colors.white, fontWeight: FontWeight.w200),
        ),
        Container(
          height: 230.0,
          width: 230.0,
          child: Center(
            child: Stack(
              children: <Widget>[
                Center(
                  child: CustomPaint(
                    foregroundPainter:
                        CircleProgress(animation.value, animationInner.value),
                    child: Container(
                      height: 230.0,
                      width: 230.0,
                    ),
                  ),
                ),
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
    );
  }
}
