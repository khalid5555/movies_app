// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final String? lab;
  final bool obscureText;
  final Color? color;
  final int? min;
  final IconData? icon;
  final TextEditingController? myController;
  final TextInputType? keyType;
  final Function(String?)? onClick;
  final Function(String?)? onChange;
  AppTextField({
    Key? key,
    required this.hint,
    this.lab,
    this.obscureText = false,
    this.color = AppColors.kWhite,
    this.min = 1,
    required this.icon,
    this.myController,
    this.keyType,
    this.onClick,
    this.onChange,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      maxLines: min,
      // ignore: missing_return
      validator: (value) {
        if (value!.isEmpty) {
          return 'الرجاء ملىء الحقل';
        }
        return null;
      },
      onSaved: onClick,
      onChanged: (value) => onChange!(value),
      keyboardType: keyType,
      textAlign: TextAlign.end,
      style: TextStyle(fontSize: 13),
      cursorColor: AppColors.kbiColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.kPrColor),
        filled: true,
        labelText: lab,
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14, color: color),
        fillColor: Colors.white.withOpacity(.3),
        // enabledBorder: OutlineInputBorder(
        //   gapPadding: 0,
        //   borderRadius: BorderRadius.circular(12),
        //   borderSide: BorderSide(color: AppColors.kWhite),
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.kGrColor.withOpacity(.2),
          ),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(
        //     color: Colors.red,
        //   ),
        // ),
      ),
    );
  }
}
