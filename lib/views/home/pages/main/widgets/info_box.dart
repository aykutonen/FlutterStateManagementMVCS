import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final double marginLeft;
  final double marginRight;

  const InfoBox(
      {@required this.title,
      @required this.children,
      this.marginLeft = 0.0,
      this.marginRight = 0.0});

  @override
  Widget build(BuildContext context) {
    children.insert(
      0,
      Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.black26,
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(left: marginLeft, right: marginRight),
        height: 125.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }
}
