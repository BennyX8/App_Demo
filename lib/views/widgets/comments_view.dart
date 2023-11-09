import 'package:app_demo/core/constants.dart';
import 'package:app_demo/views/widgets/comment_view.dart';
import 'package:flutter/material.dart';

import '../../core/strings.dart';

class CommentsView extends StatefulWidget {
  const CommentsView({super.key});

  @override
  State<CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<CommentsView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: Material(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: Colors.grey.shade700,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('45k Comments'),
              ),
            ),
            hSpace(h: 20.0),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12.0),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return CommentView(comment: comments[index]);
                },
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 70.0,
              child: Row(
                children: [
                  wSpace(w: 16),
                  const CircleAvatar(
                    foregroundImage: AssetImage(
                      'assets/images/Terry.png',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.emoji_emotions),
                          suffixIcon: const Icon(
                            Icons.send_rounded,
                            color: Color(0xFF5C8DFF),
                          ),
                          hintText: 'Add comment',
                          hintStyle: TextStyle(color: Colors.grey.shade300),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  wSpace(w: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
