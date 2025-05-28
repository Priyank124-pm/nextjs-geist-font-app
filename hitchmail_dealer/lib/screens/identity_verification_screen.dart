import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'approval_pending_screen.dart';

class IdentityVerificationScreen extends StatefulWidget {
  static const routeName = '/identity-verification';

  @override
  _IdentityVerificationScreenState createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState extends State<IdentityVerificationScreen> {
  File? _frontId;
  File? _backId;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isFront) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          _frontId = File(pickedFile.path);
        } else {
          _backId = File(pickedFile.path);
        }
      });
    }
  }

  void _submit() {
    if (_frontId != null && _backId != null) {
      Navigator.pushNamed(context, ApprovalPendingScreen.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload both front and back of your ID')),
      );
    }
  }

  Widget _buildUploadArea(String label, File? imageFile, bool isFront) {
    return GestureDetector(
      onTap: () => _pickImage(isFront),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: imageFile == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt, size: 48, color: Colors.grey),
                  SizedBox(height: 8),
                  Text(label, style: TextStyle(color: Colors.grey)),
                ],
              )
            : Stack(
                children: [
                  Image.file(imageFile, fit: BoxFit.cover, width: 150, height: 150),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isFront) {
                            _frontId = null;
                          } else {
                            _backId = null;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitEnabled = _frontId != null && _backId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Your Identity'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Please upload clear pictures of your government-issued photo ID (e.g., Driver\'s License, Passport).',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildUploadArea('Front ID', _frontId, true),
                _buildUploadArea('Back ID', _backId, false),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: isSubmitEnabled ? _submit : null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Text('Submit for Approval', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
