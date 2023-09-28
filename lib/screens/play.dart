
import 'package:flutter/material.dart';

void main() {
  runApp(RandomNumberApp());
}

class RandomNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomNumberPage(),
    );
  }
}

class RandomNumberPage extends StatefulWidget {
  @override
  _RandomNumberPageState createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int randomNum = 0;

  void generateRandomNumber() {
    // final random = Random();
    // setState(() {
    //   randomNum = random.nextInt(100); // Change the range as needed
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Random Number:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$randomNum',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateRandomNumber,
              child: Text('Generate Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}
    