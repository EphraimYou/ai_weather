import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextForm extends StatelessWidget {
  final bool autofocus;
  final bool obscureText;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onTap;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextForm({
    super.key,
    this.autofocus = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        autofocus: autofocus,
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: 25,
            color: Colors.blueGrey,
          ),
          suffixIcon: IconButton(
            onPressed: onTap,
            icon: Icon(suffixIcon),
            iconSize: 25,
            color: Colors.blueGrey,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blue, width: 1.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blue, width: 1.w),
          ),
        ),
      ),
    );
  }
}
