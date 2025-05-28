import 'package:flutter/material.dart';

class ApprovalPendingScreen extends StatelessWidget {
  static const routeName = '/approval-pending';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Submitted!'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty, size: 100, color: Colors.blue),
            SizedBox(height: 24),
            Text(
              'Your application is under review. We will notify you via email and in the app once your account is approved.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to login or stay on this screen with status update
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text('OK / Go to Login', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
