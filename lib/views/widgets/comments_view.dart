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
          ],
        ),
      ),
    );
  }
}
