import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScorePage(),
    );
  }
}

class ScorePage extends StatefulWidget {
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int randomNum = 0;

  void generateScoreNumber() {
    final random = Random();
    setState(() {
      randomNum = random.nextInt(100); // Change the range as needed
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Score:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$randomNum',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateScoreNumber,
              child: Text('Check your score'),
            ),
          ],
        ),
      ),
    );
  }
}
