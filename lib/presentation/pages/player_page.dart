import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/core/audio_service.dart';
import 'package:meditation_app/injecttion_container.dart';
import 'package:meditation_app/presentation/providers/bottom_panel_provider.dart';
import 'package:meditation_app/presentation/providers/center_panel_provider.dart';
import 'package:meditation_app/presentation/providers/current_volume_provider.dart';
import 'package:meditation_app/presentation/providers/player_provider.dart';
import 'package:meditation_app/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({Key key}) : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool _visible;
  bool _pausedPanelVisible;
  bool _soundOn;
  //int duration;

  @override
  void initState() {
    super.initState();
    _visible = false;
    _pausedPanelVisible = true;
    _soundOn = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark),
        child: Scaffold(body: Consumer<PlayerProvider>(
          builder: (context, provider, child) {
            return Stack(
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
                                onTap: () async {
                                  sl<MainAudioService>()
                                      .stopAudio(provider.audioPlayer);
                                  bool state = Provider.of<BottomPanelProvider>(
                                          context,
                                          listen: false)
                                      .panelState;
                                  if (!state) {
                                    Provider.of<BottomPanelProvider>(context,
                                            listen: false)
                                        .changePanelState();
                                  }
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
                                      if (!_soundOn) {
                                        provider.audioPlayer.setVolume(0.0);
                                      } else {
                                        var _volume =
                                            Provider.of<CurrentVolumeProvider>(
                                                    context,
                                                    listen: false)
                                                .currentVolume;
                                        if (_volume != 0.0) {
                                          provider.audioPlayer
                                              .setVolume(_volume);
                                        } else {
                                          provider.audioPlayer.setVolume(0.5);
                                        }
                                      }
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
                                          ? PausedButtonPanel(
                                              provider.audioPlayer)
                                          : ResumeButtonPanel(
                                              provider.audioPlayer),
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
                                  audioPlayer: provider.audioPlayer,
                                )
                              : SettingPanelWidget(
                                  audioPlayer: provider.audioPlayer,
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
