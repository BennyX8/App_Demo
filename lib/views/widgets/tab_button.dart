import 'package:app_demo/core/constants.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final bool isActive;
  final bool? showChip;
  final VoidCallback onTap;
  final IconData icon;
  final String title;

  const TabButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    required this.isActive,
    this.showChip,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 64,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => onTap(),
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isActive ? const Color(0xFFFFDD5E) : Colors.white,
                ),

                // Vertical Space
                hSpace(h: 4),

                Text(
                  title,
                  style: TextStyle(
                    color: isActive ? const Color(0xFFFFDD5E) : Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          if (showChip != null && showChip!)
            const SizedBox(
              width: 30,
              height: 24,
              child: Card(
                color: Color(0xFFFA8989),
                child: Center(child: Text('25')),
              ),
            ),
        ],
      ),
    );
  }
}
