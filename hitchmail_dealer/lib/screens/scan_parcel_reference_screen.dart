import 'package:flutter/material.dart';
import 'parcel_details_screen.dart';

class ScanParcelReferenceScreen extends StatefulWidget {
  static const routeName = '/scan-parcel-reference';

  final bool isScanIn;

  ScanParcelReferenceScreen({Key? key, this.isScanIn = true}) : super(key: key);

  @override
  _ScanParcelReferenceScreenState createState() => _ScanParcelReferenceScreenState();
}

class _ScanParcelReferenceScreenState extends State<ScanParcelReferenceScreen> {
  String scannedText = '';

  void _confirmScan() {
    if (scannedText.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParcelDetailsScreen(
            referenceNumber: scannedText,
            isScanIn: widget.isScanIn,
          ),
        ),
      );
    }
  }

  void _rescan() {
    setState(() {
      scannedText = '';
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Reference Number'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black12,
                child: Center(
                  child: Text(
                    'Camera Viewfinder Placeholder',
                    style: TextStyle(color: Colors.black45, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'OCR Result',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  scannedText = value;
                });
              },
              controller: TextEditingController(text: scannedText),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: scannedText.isNotEmpty ? _confirmScan : null,
                  child: Text('Confirm Scan'),
                ),
                ElevatedButton(
                  onPressed: _rescan,
                  child: Text('Re-scan'),
                ),
                ElevatedButton(
                  onPressed: _cancel,
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
