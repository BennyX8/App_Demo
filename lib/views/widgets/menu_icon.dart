import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox.square(
        dimension: 32.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFFA68405)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.menu,
            color: Colors.blue.shade800,
          ),
        ),
      ),
    );
  }
}
