import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Function onScanIn;
  final Function onScanOut;

  HomePage({required this.onScanIn, required this.onScanOut});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isScanningIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitchmail Dealer - Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: [isScanningIn, !isScanningIn],
              onPressed: (index) {
                setState(() {
                  isScanningIn = index == 0;
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Scan In'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Scan Out'),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (isScanningIn) {
                  widget.onScanIn();
                } else {
                  widget.onScanOut();
                }
              },
              child: Text(isScanningIn ? 'Start Scan In' : 'Start Scan Out'),
            ),
          ],
        ),
      ),
    );
  }
}
