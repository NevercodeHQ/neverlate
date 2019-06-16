import 'package:flutter/material.dart';
import 'package:neverlate/main_page.dart';

class HomePage extends StatefulWidget {
  @override
  _homePage createState() => _homePage();
}

class _homePage extends State<HomePage> {
  String _image_name = 'assets/images/hat_on.png';

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new InkWell(
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Text('\n Neverlate \n ', style: new TextStyle(
                fontFamily: 'ProximaNova',
                color: Colors.black,
                fontSize: 50.0,
                fontWeight: FontWeight.bold)),
            RaisedButton(
              color: Color(0xFFfebb00),
              child: new Text('Blow my mind', style: new TextStyle(
                  fontFamily: 'ProximaNova',
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              onPressed: () {
                _onButtonTap();
                _sleep_sec();
              },
            ),
            Spacer(),
            Align(
              alignment : Alignment.bottomLeft,
              child : Image.asset(
                _image_name,
              )
            )
          ],

        ),
      ),
    );
  }
  void _onButtonTap() {
    setState(() {
      _image_name = 'assets/images/hat_off.png';
    });
  }

  void _sleep_sec() async {
    await new Future.delayed(const Duration(milliseconds: 600));
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new MainPage();
    }));
  }
}