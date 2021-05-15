import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({@required this.icon, @required this.function});

  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      child: Icon(
        icon,
        color: Colors.white,
        size: 30.0,
      ),
      shape: CircleBorder(),
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.transparent,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Colors.black12,
    );
  }
}
