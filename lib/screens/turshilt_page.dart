import 'dart:ui';
import 'package:app/screens/score_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(DrawingApp());
}

class DrawingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing Section',
      home: DrawingScreen(),
    );
  }
}

class DrawingScreen extends StatefulWidget {
  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<List<Offset>> points = [];
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing Section'),
        actions: <Widget>[
          // Color options in the app bar
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: _showColorPicker,
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255), // Set the background color to blue
        child: Stack(
          children: [
            GestureDetector(
              onPanStart: (details) {
                setState(() {
                  points.add([details.localPosition]); // Create a new list for each line
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  if (points.isNotEmpty) {
                    points.last.add(details.localPosition); // Add points to the last line
                  }
                });
              },
              onPanEnd: (details) {
                setState(() {
                  points.add([]); // Add an empty list as a separator
                });
              },
              child: CustomPaint(
                painter: _DrawingPainter(points, selectedColor),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 30,
              child: ElevatedButton.icon(
                onPressed: () => setState(() => points.clear()),
                icon: Icon(Icons.clear),
                label: Text("Clear Board"),
              ),
            ),
            Positioned(
              top: 80,
              right: 30,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScorePage()));
                },
                icon: Icon(Icons.score),
                label: Text("Score"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show color picker dialog
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select a Color"),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
                Navigator.of(context).pop(); // Close the color picker dialog
              },
            ),
          ),
        );
      },
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<List<Offset>> lines;
  final Color color;

  _DrawingPainter(this.lines, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    for (final line in lines) {
      if (line.length < 2) continue;
      for (int i = 0; i < line.length - 1; i++) {
        canvas.drawLine(
          line[i],
          line[i + 1],
          Paint()
            ..color = color
            ..isAntiAlias = true
            ..strokeWidth = 5.0 // Set a fixed stroke width
            ..strokeCap = StrokeCap.round,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
