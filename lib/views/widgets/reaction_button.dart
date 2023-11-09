import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReactionButton extends StatelessWidget {
  final String asset;
  final String? count;
  final VoidCallback onTap;

  const ReactionButton({
    super.key,
    required this.asset,
    this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      onPressed: onTap,
      icon: Column(
        children: [
          SvgPicture.asset(asset),
          if (count != null) Text(count!),
        ],
      ),
    );
  }
}
