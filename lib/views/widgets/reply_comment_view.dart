import 'package:app_demo/core/constants.dart';
import 'package:app_demo/core/route_builder.dart';
import 'package:app_demo/models/comment.dart';
import 'package:flutter/material.dart';

class ReplyCommentView extends StatelessWidget {
  final Comment comment;

  const ReplyCommentView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
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
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    wSpace(w: 10.0),
                    Text(
                      comment.username,
                      style: const TextStyle(
                        color: Color(0xFF5C8DFF),
                      ),
                    ),
                    wSpace(w: 10.0),
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
                        GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              KRoute(
                                child: ReplyCommentView(comment: comment),
                              ),
                            );
                          },
                          child: ImageIcon(
                            const AssetImage('assets/icons/comment.png'),
                            color: Colors.grey.shade600,
                            size: 18.0,
                          ),
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
                const Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Replying to ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'John Doe @JohntheD',
                          style: TextStyle(
                            color: Color(0xFFFFBB00),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color(0xFFFFBB00),
                        ),
                      ],
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
