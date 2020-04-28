import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:meditation_app/core/audio_service.dart';
import 'package:meditation_app/injecttion_container.dart';
import 'package:meditation_app/presentation/providers/bottom_panel_provider.dart';
import 'package:meditation_app/presentation/providers/current_volume_provider.dart';
import 'package:meditation_app/presentation/providers/duration_provider.dart';
import 'package:meditation_app/presentation/providers/player_provider.dart';
import 'package:provider/provider.dart';

class SettingPanelWidget extends StatefulWidget {
  const SettingPanelWidget({Key key}) : super(key: key);

  @override
  _SettingPanelWidgetState createState() => _SettingPanelWidgetState();
}

class _SettingPanelWidgetState extends State<SettingPanelWidget> {
  double _initValue;
  ui.Image customImage;

  Future<ui.Image> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();

    return fi.image;
  }

  @override
  void initState() {
    var _preInitValue =
        Provider.of<CurrentVolumeProvider>(context, listen: false)
            .currentVolume;
    _preInitValue == 0 ? _initValue = 1.0 : _initValue = _preInitValue;
    loadImage('res/images/more_volume.png').then((image) {
      setState(() {
        customImage = image;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, provider, child) {
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
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white38,
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 2.0,
                  thumbColor: Colors.white,
                  thumbShape: SliderThumbImage(customImage),
                  overlayColor: Colors.white.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),
                ),
                child: Slider(
                  min: 0,
                  max: 1,
                  value: _initValue,
                  onChanged: (value) {
                    setState(() {
                      _initValue = value;
                      provider.audioPlayer.setVolume(value);
                      Provider.of<CurrentVolumeProvider>(context, listen: false)
                          .setVolume(value);
                    });
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
                        GestureDetector(
                          onTap: () async {
                            AudioPlayerState state = provider.audioPlayer.state;

                            if (state == AudioPlayerState.PAUSED) {
                              Provider.of<BottomPanelProvider>(context,
                                      listen: false)
                                  .changePanelState();
                            }
                            sl<MainAudioService>()
                                .stopAudio(provider.audioPlayer);
                            final AudioPlayer player =
                                await sl<MainAudioService>()
                                    .playAudio('sounds/ocean_sound.mp3');
                            Provider.of<PlayerProvider>(context, listen: false)
                                .setAudioPlayer(player);
                            int duration = await sl<MainAudioService>()
                                .getDuration(player);
                            Provider.of<DurationProvider>(context,
                                    listen: false)
                                .setDuration(duration);
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              image: new DecorationImage(
                                image: new AssetImage(
                                    'res/images/picture_ocean.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
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
                    //TODO надо разобраться как делать оверлей на неактивной картинке
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            AudioPlayerState state = provider.audioPlayer.state;

                            if (state == AudioPlayerState.PAUSED) {
                              Provider.of<BottomPanelProvider>(context,
                                      listen: false)
                                  .changePanelState();
                            }

                            sl<MainAudioService>()
                                .stopAudio(provider.audioPlayer);
                            final AudioPlayer player =
                                await sl<MainAudioService>()
                                    .playAudio('sounds/cafe_sound.mp3');

                            Provider.of<PlayerProvider>(context, listen: false)
                                .setAudioPlayer(player);
                            int duration = await sl<MainAudioService>()
                                .getDuration(player);
                            Provider.of<DurationProvider>(context,
                                    listen: false)
                                .setDuration(duration);
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              image: new DecorationImage(
                                image: new AssetImage(
                                    'res/images/picture_cafe.png'),
                                fit: BoxFit.fill,
                              ),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                              border: new Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 4.0,
                        ),
                        Text(
                          'Cafe',
                          style:
                              TextStyle(color: Colors.white38, fontSize: 12.0),
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
                              image: new AssetImage(
                                  'res/images/picture_airport.png'),
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
                          style:
                              TextStyle(color: Colors.white38, fontSize: 12.0),
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
                              image: new AssetImage(
                                  'res/images/picture_piano.png'),
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
                          style:
                              TextStyle(color: Colors.white38, fontSize: 12.0),
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
                              image: new AssetImage(
                                  'res/images/picture_storm.png'),
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
                          style:
                              TextStyle(color: Colors.white38, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}

class SliderThumbImage extends SliderComponentShape {
  final ui.Image image;

  SliderThumbImage(this.image);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(0, 0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value}) {
    final canvas = context.canvas;
    final imageWidth = image?.width ?? 20;
    final imageHeight = image?.height ?? 20;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight / 2),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    if (image != null) {
      canvas.drawImage(image, imageOffset, paint);
    }
  }
}
