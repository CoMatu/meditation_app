import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meditation_app/presentation/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<PermissionGroup, PermissionStatus> permissions;
  var pageIndicator = 0;

  final _controlWidgets = <int, Widget>{
    0: Text('MEDITATION'),
    1: Text('COURSES'),
    2: Text('SOUNDS'),
  };

  List<Widget> bodies = [
    MeditationWidget(),
    CoursesWidget(),
    SoundsWidget(),
  ];

  void getPermission() async {
    permissions = await PermissionHandler().requestPermissions([
      PermissionGroup.storage,
    ]);
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        previousPageTitle: 'Mindfullness',
        border: Border(),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 44.0,
              child: CupertinoSlidingSegmentedControl(
                groupValue: pageIndicator,
                children: _controlWidgets,
                onValueChanged: (index) {
                  setState(() {
                    pageIndicator = index;
                  });
                },
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: bodies[pageIndicator],
          ),
        ],
      ),
    );
  }
}
