import 'package:flutter/material.dart';
import 'package:app/screens/score_page.dart';
import 'package:app/screens/turshilt_page.dart';

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
          context,
          MaterialPageRoute(builder: (context) => DrawingScreen()),
        );
        break;
      case "nihongo":
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => DrawingScreen())),
        );
        break;
      case "check":
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => ScorePage())),
        );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selector'),
        backgroundColor: Colors.blue, // Customize the app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "mongol");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Button background color
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Add padding
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white, // Icon color
                      size: 24.0, // Set the icon size
                    ),
                    SizedBox(width: 10), // Add spacing between icon and text
                    Text(
                      'Монгол',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "nihongo");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Customize button color
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '日本語',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     // onScoringScreen(context, "check");
            //   },
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.orange, // Customize button color
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Icon(
            //           Icons.check,
            //           color: Colors.white,
            //           size: 24.0,
            //         ),
            //         SizedBox(width: 10),
            //         Text(
            //           'CHECK',
            //           style: TextStyle(
            //             fontSize: 18,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onScoringScreen(context, "garah");
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Customize button color
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'QUIT',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
