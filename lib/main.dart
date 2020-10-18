import 'package:flutter/material.dart';
import 'calculation.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LUCK CALCULATOR",
      // home: MyCalculator(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/tenor.gif',
        nextScreen: MyCalculator(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.lightBlueAccent,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyCalculator extends StatefulWidget {
  MyCalculator({Key key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String firstName;
  String secondName;
  int score;

  void luckScore() {
    // score = Random().nextInt(40)+ 50;
    score = calculation(
      firstName: firstName,
      secondName: secondName,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScorePage(score: score)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LUCK CALCULATOR"),
          centerTitle: true,
          titleSpacing: 2,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'luckgif',
                  child: Image(image: AssetImage('assets/images/dog.gif')),
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                firstName = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                secondName = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Partener's Name",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () => {luckScore()},
              child: Text('CALCULATE'),
              color: Colors.blue,
            )
          ],
        ));
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({
    Key key,
    @required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LUCK CALCULATOR"),
          centerTitle: true,
          titleSpacing: 2,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'luckgif',
                  child: Image(
                    image: AssetImage('assets/images/dog.gif'),
                  ),
                ),
              )),
              Text('YOUR SCORE IS :-  $score',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            ],
          ),
        ));
  }
}
