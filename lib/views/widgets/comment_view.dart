import 'package:app_demo/core/constants.dart';
import 'package:app_demo/models/comment.dart';
import 'package:flutter/material.dart';

class CommentView extends StatelessWidget {
  final Comment comment;

  const CommentView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: AssetImage(
              'assets/images/${comment.userAvatar}.png',
            ),
          ),
          wSpace(w: 12.0),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      comment.name,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    wSpace(w: 10.0),
                    const Spacer(),
                    Text(comment.time),
                  ],
                ),
                hSpace(h: 4.0),
                Text(
                  comment.text,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
                hSpace(h: 12.0),
                Row(
                  children: [
                    Row(
                      children: [
                        ImageIcon(
                          const AssetImage('assets/icons/comment.png'),
                          color: Colors.grey.shade600,
                          size: 18.0,
                        ),
                        wSpace(w: 4.0),
                        Text(comment.replies ?? '')
                      ],
                    ),
                    wSpace(w: 25.0),
                    Row(
                      children: [
                        ImageIcon(
                          const AssetImage('assets/icons/lineHeart.png'),
                          color: Colors.grey.shade600,
                          size: 18.0,
                        ),
                        wSpace(w: 4.0),
                        Text(comment.likes ?? '')
                      ],
                    ),
                    wSpace(w: 15.0),
                    Row(
                      children: [
                        ImageIcon(
                          const AssetImage('assets/icons/flag.png'),
                          color: Colors.grey.shade400,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ],
                ),
                if (comment.replies != null)
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                              color: Colors.grey.shade300, width: 0.8),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'View 15 replies',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Color(0xFFBD6565),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                hSpace(h: 12.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
