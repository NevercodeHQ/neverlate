import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;
  var card1 = {};
  var card2 = {};
  var card3 = {};
  final List headers = new List();

  @override
  void initState() {
    super.initState();
    headers.add({'header': 'The fighting deer didn\'t let me to cross the road', 'assetName': '1.png'});
    headers.add({'header': 'The police were arresting someone and I was taking a video for my youtube channel', 'assetName': '2.png'});
    headers.add({'header': 'My pants were in the dryer', 'assetName': '3.png'});
    headers.add({'header': 'Got lost trying to escape from police', 'assetName': '4.png'});
    headers.add({'header': 'I thought it\'s Christmas now', 'assetName': '5.png'});
    headers.add({'header': 'I got into a fight with the bus conductor. He wanted John Snow to be on the Iron Throne', 'assetName': '6.png'});
    headers.add({'header': 'I smashed the alarm trying to kill a mosquito with a hammer', 'assetName': '7.png'});
    headers.add({'header': 'Bohemian Rhapsody started playing on the radio. Then followed by Kashmir, Paradise City, and Piano Man', 'assetName': '8.png'});
    headers.add({'header': 'I couldn\'t find my glasses. Then I realized that I don\'t have any', 'assetName': '9.png'});
    headers.add({'header': 'Accidentally mixed sugar with cocaine up and my morning coffee was a bit stronger than usually', 'assetName': '10.png'});
    shuffle();

    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void shuffle() {
    headers.shuffle(math.Random.secure());

    setState(() {
      card1 = headers[0];
      card2 = headers[1];
      card3 = headers[2];
    });
    const duration = const Duration(milliseconds: 400);
    const curve = Curves.ease;

    if (pageController != null) {
      pageController.animateToPage(0, duration: duration, curve: curve);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: PageView(
            controller: pageController,
            children: <Widget>[
              SlidingCard(
                header: card1['header'],
                subheader: '¯\\_(ツ)_/¯',
                assetName: card1['assetName'],
                offset: pageOffset,
              ),
              SlidingCard(
                header: card2['header'],
                subheader: '¯\\_(ツ)_/¯',
                assetName: card2['assetName'],
                offset: pageOffset - 1,
              ),
              SlidingCard(
                header: card3['header'],
                subheader: '¯\\_(ツ)_/¯',
                assetName: card3['assetName'],
                offset: pageOffset - 2,
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        RaisedButton(
          color: Color(0xFFfebb00),
          child: new Text('Shuffle', style: new TextStyle(
              fontFamily: 'ProximaNova',
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          onPressed: () { shuffle(); },
        ),
      ]
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String header;
  final String subheader;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.header,
    @required this.subheader,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 24),
        elevation: 9, //shadow around cards
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                'assets/images/$assetName',
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                header: header,
                subheader: subheader,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String header;
  final String subheader;
  final double offset;

  const CardContent(
      {Key key,
      @required this.header,
      @required this.subheader,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(header,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'ProximaNova',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              subheader,
              style: TextStyle(fontFamily: 'ProximaNova', color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
