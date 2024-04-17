
/////////////////////////////////// Inputfeild Design /////////////////////////////////////////////////

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool readOnly;
  final String initialValue;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.readOnly = true,
    this.initialValue = "",
    this.onChanged,
    this.controller,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: TextFormField(
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: suffixIcon,
          ),
          onTap: () {
            if (readOnly) {
              onTap?.call();
            }
          },
        ),
      ),
    );
  }
}
