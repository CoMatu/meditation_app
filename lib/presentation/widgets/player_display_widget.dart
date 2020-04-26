import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/widgets/widgets.dart';

class PlayerDisplayWidget extends StatelessWidget {
  const PlayerDisplayWidget({
    Key key,
    @required this.animation,
    @required this.animationInner,
  }) : super(key: key);

  final Animation animation;
  final Animation animationInner;

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
