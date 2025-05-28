import 'package:flutter/material.dart';

class BusinessHoursPage extends StatefulWidget {
  @override
  _BusinessHoursPageState createState() => _BusinessHoursPageState();
}

class _BusinessHoursPageState extends State<BusinessHoursPage> {
  bool isClosedToday = false;
  TimeOfDay? openTime;
  TimeOfDay? closeTime;

  Future<void> _selectTime(BuildContext context, bool isOpenTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isOpenTime ? (openTime ?? TimeOfDay(hour: 9, minute: 0)) : (closeTime ?? TimeOfDay(hour: 17, minute: 0)),
    );
    if (picked != null) {
      setState(() {
        if (isOpenTime) {
          openTime = picked;
        } else {
          closeTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business Hours'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Closed Today'),
              value: isClosedToday,
              onChanged: (value) {
                setState(() {
                  isClosedToday = value;
                });
              },
            ),
            if (!isClosedToday) ...[
              ListTile(
                title: Text('Open Time'),
                subtitle: Text(openTime?.format(context) ?? 'Not set'),
                onTap: () => _selectTime(context, true),
              ),
              ListTile(
                title: Text('Close Time'),
                subtitle: Text(closeTime?.format(context) ?? 'Not set'),
                onTap: () => _selectTime(context, false),
              ),
            ],
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // TODO: Save business hours settings
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Business hours saved')),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
