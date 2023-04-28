// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FormData extends StatelessWidget {
  final TextEditingController controller;

  final String label;
  final int lines;
  final double width;
  final val;
  final saved;
  final inputFormatter;
  final int? lenght;
  final suffixIcon;
  final readOnly;
  final onChanged;
  final prerfixIcon;
  final obscureText;

  const FormData(
      {super.key,
      required this.readOnly,
      this.label = '',
      this.lines = 1,
      this.width = 0.0,
      required this.controller,
      this.val,
      this.saved,
      this.inputFormatter,
      this.lenght,
      this.suffixIcon,
      this.onChanged,
      this.prerfixIcon,
      this.obscureText});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        onChanged: onChanged,
        readOnly: readOnly,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatter,
        controller: controller,
        maxLines: lines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.blueGrey[50],
          counterStyle: const TextStyle(
            height: double.minPositive,
          ),
          prefixIcon: prerfixIcon,
          suffixIcon: suffixIcon,
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade50),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
          hintText: label,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 12),
        ),
        style: const TextStyle(color: Colors.black),
        validator: val,
        onSaved: saved,
      ),
    );
  }
}
