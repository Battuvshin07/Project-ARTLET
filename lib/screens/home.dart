import 'package:app/screens/score_page.dart';
import 'package:app/screens/turshilt_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CombinedScreen(),
    );
  }
}

class CombinedScreen extends StatelessWidget {
  void onScoringScreen(BuildContext context, String path) {
    switch (path) {
      case "mongol":
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DrawingScreen()));
        break;
      case "nihongo":
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => DrawingScreen())));
        break;
      case "check":
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => ScorePage())));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "mongol");
              },
              child: const Text('Монгол'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "nihongo");
              },
              child: Text('日本語'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "check");
              },
              child: Text('CHECK'),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "garah");
              },
              child: Text('QUIT'),
            ),
          ],
        ),
      ),
    );
  }
}
