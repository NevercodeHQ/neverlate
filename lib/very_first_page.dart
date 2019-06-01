import 'package:flutter/material.dart';
import 'package:neverlate/home_page.dart';

class veryFirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.white,
      child: new InkWell(
        child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Text(' Neverlate \n ', style : new TextStyle(color: Colors.black, fontSize : 50.0, fontWeight : FontWeight.bold)),
            RaisedButton(
            color: Colors.white,
            child: new Text('Blow my mind', style : new TextStyle(color: Colors.black, fontSize : 25.0, fontWeight : FontWeight.bold)),
            onPressed: () {
              //Use`Navigator` widget to push the second screen to out stack of screens
              Navigator.of(context)
                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                return new HomePage();
              }));
            },
          )],
        ),
      ),
    );
  }
}