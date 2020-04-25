
import 'package:flutter/material.dart';

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
                    child: Text(
              'HEADLINE',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text('See all', style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}