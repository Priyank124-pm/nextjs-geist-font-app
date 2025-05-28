import 'package:flutter/material.dart';

class PinInputPage extends StatefulWidget {
  final Function(String) onPinEntered;

  PinInputPage({required this.onPinEntered});

  @override
  _PinInputPageState createState() => _PinInputPageState();
}

class _PinInputPageState extends State<PinInputPage> {
  final TextEditingController _pinController = TextEditingController();
  String? _validationMessage;

  void _validatePin() {
    final pin = _pinController.text.trim();
    if (pin.length != 4 || !RegExp(r'^\d{4}$').hasMatch(pin)) {
      setState(() {
        _validationMessage = 'Please enter a valid 4-digit PIN';
      });
      return;
    }
    setState(() {
      _validationMessage = null;
    });
    widget.onPinEntered(pin);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PIN accepted, process complete')),
    );
    // TODO: Update tracking system to mark parcel as claimed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Pickup PIN'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pinController,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: InputDecoration(
                labelText: '4-digit PIN',
                errorText: _validationMessage,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _validatePin,
              child: Text('Submit PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
