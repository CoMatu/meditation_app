import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/presentation/providers/bottom_panel_provider.dart';
import 'package:meditation_app/presentation/providers/center_panel_provider.dart';
import 'package:meditation_app/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatefulWidget {
  final AudioPlayer player;
  PlayerPage( this.player, {Key key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState(player);
}

class _PlayerPageState extends State<PlayerPage> with TickerProviderStateMixin {
  AnimationController progressController;
  AnimationController progressInnerController;
  Animation animation;
  Animation animationInner;
  bool _visible;
  bool _pausedPanelVisible;
  bool _soundOn;
  AudioPlayer audioPlayer;

  _PlayerPageState(this.audioPlayer);

  @override
  void initState() {
    super.initState();
    _visible = false;
    _pausedPanelVisible = true;
    _soundOn = true;
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
                              onTap: () {
                                setState(() {
                                  _soundOn = !_soundOn;
                                });
                              },
                              child: _soundOn
                                  ? Container(
                                      width: 45.0,
                                      child: Image.asset(
                                          'res/images/sound-thin.png'),
                                    )
                                  : Container(
                                      width: 42.0,
                                      child: Image.asset(
                                          'res/images/sound_off.png'),
                                    ),
                            ),
                            GestureDetector(onTap: () {
                              Provider.of<CenterPanelProvider>(context,
                                      listen: false)
                                  .changePanelState();
                            }, child: Consumer<CenterPanelProvider>(
                              builder: (context, state, child) {
                                return state.panelState
                                    ? Container(
                                        width: 45.0,
                                        child: Image.asset(
                                            'res/images/settings.png'),
                                      )
                                    : Container(
                                        width: 45.0,
                                        child: Image.asset(
                                            'res/images/setting_on.png'),
                                      );
                              },
                            )),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                Consumer<CenterPanelProvider>(
                  builder: (context, state, child) {
                    return state.panelState
                        ? Consumer<BottomPanelProvider>(
                            builder: (context, state, child) {
                              return Column(
                                children: <Widget>[
                                  state.panelState
                                      ? PausedButtonPanel(audioPlayer)
                                      : ResumeButtonPanel(audioPlayer),
                                  Container(
                                    height: 58.0,
                                  ),
                                ],
                              );
                            },
                          )
                        : Container();
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Consumer<CenterPanelProvider>(
                    builder: (context, state, child) {
                      return state.panelState
                          ? PlayerDisplayWidget(
                          animation: animation,
                          animationInner: animationInner)
                          : SettingPanelWidget();
                    },
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
