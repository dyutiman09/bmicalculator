import 'package:flutter/material.dart';
import 'constants.dart';

class gesture extends StatelessWidget {
  gesture({@required this.ontap, @required this.onstring});

  final Function ontap;
  final String onstring;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
              onstring,
              style: klargetextstyle,
            )),
        color: Colors.blueAccent,
        margin: EdgeInsets.only(top: 10.00),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.00),
        height: kbottomcontainerheight,
      ),
    );
  }
}