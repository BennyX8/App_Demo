import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MoreLink extends StatelessWidget {
  final VoidCallback onTap;

  const MoreLink({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.black26,
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '...More',
                style: TextStyle(
                  color: Color(0xFF2CCAA0),
                ),
              ),
              wSpace(w: 5),
              Image.asset(
                'assets/icons/more_less.png',
                height: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
