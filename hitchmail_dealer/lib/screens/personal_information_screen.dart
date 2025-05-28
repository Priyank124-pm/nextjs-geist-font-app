import 'package:flutter/material.dart';
import 'identity_verification_screen.dart';

class PersonalInformationScreen extends StatefulWidget {
  static const routeName = '/personal-information';

  @override
  _PersonalInformationScreenState createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _businessNameController.dispose();
    _businessAddressController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, IdentityVerificationScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter your full name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _businessNameController,
                decoration: InputDecoration(labelText: 'Business Name'),
                validator: (value) => value == null || value.isEmpty ? 'Please enter your business name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _businessAddressController,
                decoration: InputDecoration(labelText: 'Business Address'),
                maxLines: 3,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your business address' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter your email address';
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) return 'Please enter a valid email address';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value.isEmpty ? 'Please enter your phone number' : null,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _onNext,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('Next', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
