import 'dart:io';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox.square(
            dimension: 42.0,
            child: CircularProgressIndicator(
              strokeWidth: Platform.isAndroid ? 0.5 : 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
