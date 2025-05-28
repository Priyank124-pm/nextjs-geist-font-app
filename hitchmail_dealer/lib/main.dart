import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/business_hours_page.dart';
import 'screens/parcel_history_page.dart';
import 'screens/payment_page.dart';
import 'screens/pin_input_page.dart';
import 'screens/welcome_screen.dart';
import 'screens/personal_information_screen.dart';
import 'screens/identity_verification_screen.dart';
import 'screens/approval_pending_screen.dart';
import 'screens/scan_parcel_reference_screen.dart';
import 'screens/parcel_details_screen.dart';

void main() {
  runApp(HitchmailDealerApp());
}

class HitchmailDealerApp extends StatefulWidget {
  @override
  _HitchmailDealerAppState createState() => _HitchmailDealerAppState();
}

class _HitchmailDealerAppState extends State<HitchmailDealerApp> {
  bool onboardingComplete = false;
  int _selectedIndex = 0;

  void _completeOnboarding() {
    setState(() {
      onboardingComplete = true;
    });
  }

  void _handleScanIn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanParcelReferenceScreen(isScanIn: true),
      ),
    );
  }

  void _handleScanOut() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScanParcelReferenceScreen(isScanIn: false),
      ),
    );
  }

  void _handlePinEntered(String pin) {
    // TODO: Validate PIN and update tracking system
    print('PIN entered: \$pin');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _pages => <Widget>[
        HomePage(
          onScanIn: _handleScanIn,
          onScanOut: _handleScanOut,
        ),
        BusinessHoursPage(),
        ParcelHistoryPage(),
        PaymentPage(),
        PinInputPage(
          onPinEntered: _handlePinEntered,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitchmail Dealer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: onboardingComplete
          ? Scaffold(
              body: _pages.elementAt(_selectedIndex),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code_scanner),
                    label: 'Scan',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.access_time),
                    label: 'Business Hours',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.payment),
                    label: 'Payment',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.lock),
                    label: 'PIN Input',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            )
          : WelcomeScreen(
              key: ValueKey('WelcomeScreen'),
              onGetStarted: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInformationScreen(
                      onNext: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IdentityVerificationScreen(
                              onSubmit: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ApprovalPendingScreen(
                                      onOk: _completeOnboarding,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
