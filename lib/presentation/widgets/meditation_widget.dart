import 'package:flutter/material.dart';
import 'package:meditation_app/presentation/widgets/headline_widget.dart';
import 'package:meditation_app/presentation/widgets/meditation_card.dart';

class MeditationWidget extends StatelessWidget {
  const MeditationWidget({Key key}) : super(key: key);

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
                  MeditationCard(index),
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
                  MeditationCard(index),
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
                  MeditationCard(index),
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
                  MeditationCard(index),
            ),
          ),
        ],
      ),
    );
  }
}
