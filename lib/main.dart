import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/presentation/pages/pages.dart';
import 'package:meditation_app/presentation/providers/bottom_panel_provider.dart';
import 'package:meditation_app/presentation/providers/center_panel_provider.dart';
import 'package:meditation_app/presentation/providers/current_volume_provider.dart';
import 'package:meditation_app/presentation/providers/duration_provider.dart';
import 'package:meditation_app/presentation/providers/player_provider.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/injecttion_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //без него ловит ошибку main
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (context) => BottomPanelProvider()),
                ChangeNotifierProvider(
                    create: (context) => CenterPanelProvider()),
                ChangeNotifierProvider(
                    create: (context) => CurrentVolumeProvider()),
                ChangeNotifierProvider(
                    create: (context) => PlayerProvider()),
                ChangeNotifierProvider(
                    create: (context) => DurationProvider()),
              ],
              child: MyApp(),
            ),
          ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
