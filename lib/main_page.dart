import 'package:neverlate/sliding_cards.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 8),
                Header(),
                SizedBox(height: 8),
                SlidingCardsView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        '🤷‍♂️ Neverlate 🤷‍♀',
        style: TextStyle(
          fontFamily: 'ProximaNova',
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class veryFirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.white,
      child: new InkWell(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Text('\n Neverlate \n ',
                      style : new TextStyle(fontFamily: 'ProximaNova',
                                            color: Colors.black,
                                            fontSize : 50.0,
                                            fontWeight : FontWeight.bold))],
        ),
      ),
    );
  }
}
