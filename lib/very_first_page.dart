import 'package:flutter/material.dart';
import 'package:neverlate/home_page.dart';

class veryFirstPage extends StatefulWidget {
  @override
  _veryFirstPage createState() => _veryFirstPage();
}

class _veryFirstPage extends State<veryFirstPage> {
  String _image_name = 'assets/random1.png';

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new InkWell(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Text('\n Neverlate \n ', style: new TextStyle(
                color: Colors.black,
                fontSize: 50.0,
                fontWeight: FontWeight.bold)),
            RaisedButton(
              color: Colors.white,
              child: new Text('Blow my mind', style: new TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
              onPressed: () {
                _onButtonTap();
                _sleep_sec();
              },
            ),
            Spacer(),
            Container(
                width: 400.0,
                height: 400.0,
                margin: EdgeInsets.all(0),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage(_image_name)
                    )
                ))
          ],

        ),
      ),
    );
  }

  void _onButtonTap() {
    setState(() {
      _image_name = 'assets/random2.png';
    });
  }

  void _sleep_sec() async {
    await new Future.delayed(const Duration(milliseconds: 600));
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new HomePage();
    }));
  }
}


