import 'package:flutter/material.dart';
class Reusable extends StatelessWidget {
  Reusable({@required this.colour, this.cardchild});
  final Color colour;
  final Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardchild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.00),
      ),
    );
  }
}