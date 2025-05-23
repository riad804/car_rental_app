import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String status;
  const ProgressDialog({required this.status});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                status,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
