import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/core/audio_service.dart';
import 'package:meditation_app/injecttion_container.dart';
import 'package:meditation_app/presentation/pages/pages.dart';
import 'package:meditation_app/presentation/providers/center_panel_provider.dart';
import 'package:provider/provider.dart';

class MeditationCard extends StatelessWidget {
  final int index;

  const MeditationCard(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 330,
      child: GestureDetector(
        onTap: () async {
          if (!Provider.of<CenterPanelProvider>(context, listen: false)
              .panelState) {
            Provider.of<CenterPanelProvider>(context, listen: false)
                .changePanelState();
          }
          final AudioPlayer player =
              await sl<MainAudioService>().playAudio('sounds/ocean_sound.mp3');

          int duration = await sl<MainAudioService>().getDuration(player);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayerPage(player, duration),
            ),
          );
        },
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: <Widget>[
              index.isOdd
                  ? Image.asset(
                      'res/images/background_2.png',
                      height: 200,
                      width: 330,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'res/images/background_1.png',
                      height: 200,
                      width: 330,
                      fit: BoxFit.fill,
                    ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //TODO add dots https://stackoverflow.com/questions/44579918/flutter-wrap-text-on-overflow-like-insert-ellipsis-or-fade
                      height: 70.0,
                      child: Text(
                        'Info Info Info',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'TITLE TITLE TITLE TITLE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 35,
                      child: Text(
                        'Day 1. Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle Subtitle',
                        style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'res/images/icon_clock.png',
                                  height: 19.0,
                                  width: 19.0,
                                ),
                                Container(
                                  width: 5.0,
                                ),
                                Text(
                                  '00h 00m',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonTheme(
                            height: 30.0,
                            minWidth: 74.0,
                            child: RaisedButton(
                              onPressed: () async {
                                if (!Provider.of<CenterPanelProvider>(context,
                                        listen: false)
                                    .panelState) {
                                  Provider.of<CenterPanelProvider>(context,
                                          listen: false)
                                      .changePanelState();
                                }
                                final AudioPlayer player =
                                    await sl<MainAudioService>()
                                        .playAudio('sounds/ocean_sound.mp3');

                                int duration = await sl<MainAudioService>()
                                    .getDuration(player);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PlayerPage(player, duration),
                                  ),
                                );
                              },
                              color: Colors.cyan[400],
                              child: Text(
                                'BEGIN',
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
