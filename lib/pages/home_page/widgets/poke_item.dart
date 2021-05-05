import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PokeItem extends StatelessWidget {
  String name;
  int index;
  Color? color;
  Widget image;

  PokeItem(
      {Key? key,
      required this.name,
      required this.index,
      this.color,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: <Widget>[image],
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
