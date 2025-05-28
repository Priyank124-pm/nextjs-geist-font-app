import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  // Placeholder for Stripe Connect integration
  bool paymentInProgress = false;

  void _startPayment() async {
    setState(() {
      paymentInProgress = true;
    });

    // TODO: Implement Stripe Connect payment flow

    await Future.delayed(Duration(seconds: 2)); // Simulate payment delay

    setState(() {
      paymentInProgress = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment successful')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: paymentInProgress
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _startPayment,
                child: Text('Pay with Stripe Connect'),
              ),
      ),
    );
  }
}
