import 'package:flutter/material.dart';

class ParcelHistoryPage extends StatefulWidget {
  @override
  _ParcelHistoryPageState createState() => _ParcelHistoryPageState();
}

class _ParcelHistoryPageState extends State<ParcelHistoryPage> {
  List<String> scannedParcels = [
    // Example parcel reference numbers
    'REF123456789',
    'REF987654321',
    'REF456789123',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel History'),
      ),
      body: scannedParcels.isEmpty
          ? Center(child: Text('No parcels scanned this month.'))
          : ListView.builder(
              itemCount: scannedParcels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(scannedParcels[index]),
                  subtitle: Text('Scanned on: 2024-07-01'), // Placeholder date
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement monthly reset after payment
          setState(() {
            scannedParcels.clear();
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Parcel history cleared after payment')),
          );
        },
        child: Icon(Icons.delete),
        tooltip: 'Clear History',
      ),
    );
  }
}
