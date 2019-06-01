
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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    const texts = [
      'The fighting deer didn\'t let me to cross the road.',
      'The police were arresting someone and I was taking a video for my youtube channel',
      'My pants were in the dryer',
      'Got lost trying to escape from police',
      'I thought it\'s Christmas now',
      'I got into a fight with the bus constructor. He wanted John Snow to be on the Iron Throne',
      'I smashed the alarm trying to kill a mosquito with a hammer',
      'Bohemian Rhapsody started playing on the radio. Then followed by Kashmir, Paradise City, and Piano Man',
      'Accidentally mixed sugar with a cocaine up and my morning coffee was a bit stronger than usually',
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            header: 'The fighting deer didn\'t let me to cross the road.',
            subheader: '┬┴┬┴┤( ͡° ͜ʖ├┬┴┬┴',
            assetName: '1.png',
            offset: pageOffset,
          ),
          SlidingCard(
            header: 'The police were arresting someone and I was taking a video for my youtube channel',
            subheader: '¯\\_(ツ)_/¯',
            assetName: '2.png',
            offset: pageOffset - 1,
          ),
          SlidingCard(
            header: 'My pants were in the dryer',
            subheader: 'ʕ ᵔᴥᵔ ʔ',
            assetName: '3.png',
            offset: pageOffset - 2,
          ),
          SlidingCard(
            header: 'Got lost trying to escape from police',
            subheader: '( ╯°□°)╯ ┻━━┻',
            assetName: '4.png',
            offset: pageOffset - 3,
          ),
          SlidingCard(
            header: 'I thought it\'s Christmas now',
            subheader: '¯\\_(ツ)_/¯',
            assetName: '5.png',
            offset: pageOffset - 4,
          ),
          SlidingCard(
            header: 'I got into a fight with the bus constructor. He wanted John Snow to be on the Iron Throne',
            subheader: '(︶︹︺)',
            assetName: '6.png',
            offset: pageOffset - 5,
          ),
          SlidingCard(
            header: 'I smashed the alarm trying to kill a mosquito with a hammer',
            subheader: '¯\\_(ツ)_/¯',
            assetName: '7.png',
            offset: pageOffset - 6,
          ),
          SlidingCard(
            header: 'Bohemian Rhapsody started playing on the radio. Then followed by Kashmir, Paradise City, and Piano Man',
            subheader: '¯\\_(ツ)_/¯',
            assetName: '8.png',
            offset: pageOffset - 7,
          ),
          SlidingCard(
            header: 'I couldn\'t find my glasses. Then I realized that I don\'t have any',
            subheader: '¯\\_(ツ)_/¯',
            assetName: '9.png',
            offset: pageOffset - 8,
          ),
          SlidingCard(
            header: 'Accidentally mixed sugar with a cocaine up and my morning coffee was a bit stronger than usually',
            subheader: '(⌐■_■)',
            assetName: '10.png',
            offset: pageOffset - 9,
          ),
        ],
      ),
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
        margin: EdgeInsets.only(top: 48, left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.asset(
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.5,
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(header, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              subheader,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
