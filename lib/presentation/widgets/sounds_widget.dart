import 'package:flutter/material.dart';

import 'widgets.dart';

class SoundsWidget extends StatelessWidget {
  const SoundsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HeadLineWidget(),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) =>
                  MeditationCard(),
            ),
          ),
          HeadLineWidget(),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) =>
                  MeditationCard(),
            ),
          ),
          HeadLineWidget(),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) =>
                  MeditationCard(),
            ),
          ),
          HeadLineWidget(),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) =>
                  MeditationCard(),
            ),
          ),
        ],
      ),
    );
  }
}
