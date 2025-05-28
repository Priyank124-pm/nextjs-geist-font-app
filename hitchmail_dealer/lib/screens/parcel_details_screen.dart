import 'package:flutter/material.dart';

class ParcelDetailsScreen extends StatelessWidget {
  static const routeName = '/parcel-details';

  final String referenceNumber;
  final bool isScanIn;

  ParcelDetailsScreen({Key? key, required this.referenceNumber, required this.isScanIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = isScanIn ? 'Parcel Scanned In' : 'Parcel Ready for Pickup';
    final message = isScanIn
        ? 'Parcel successfully scanned in. It is now awaiting pickup or transfer.'
        : 'Scanning this parcel confirms it\'s ready for pickup. This action will trigger a PIN to be sent to the recipient.';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              referenceNumber,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Type: ${isScanIn ? 'Scanned In' : 'Scanned Out'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              message,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            if (!isScanIn)
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text('Confirm Pickup Scan', style: TextStyle(fontSize: 18)),
                ),
              )
            else
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text('Back to Home', style: TextStyle(fontSize: 18)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
