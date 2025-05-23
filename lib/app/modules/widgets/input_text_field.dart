import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool? obscure;
  final TextEditingController controller;
  const InputTextField({
    required this.label,
    required this.icon,
    required this.controller,
    this.obscure,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          icon: icon,
          labelText: label,
        ),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String? value) {
          if (obscure == true) {
            return value!.length < 6 ? 'Enter 6 character' : null;
          }
          return value!.length < 4 ? 'Enter a valid Email' : null;
        },
      ),
    );
  }
}
