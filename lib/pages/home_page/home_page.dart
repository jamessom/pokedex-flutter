import 'package:flutter/material.dart';
import 'package:pokeflutter/consts/consts_app.dart';

class HomePage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.7),
            left: screenWidth - ( 240 / 1.6 ),
            child: Opacity(
              child: Image.asset(
                ConstsApp.whitePokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            )
          )
        ],
      ),
    );
  }
}