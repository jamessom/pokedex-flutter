import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 27, right: 7),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'PokeFlutter',
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      height: 120,
    );
  }
}