import 'package:flutter/material.dart';
class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: text,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .8,
            child: Icon(
              icon,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
