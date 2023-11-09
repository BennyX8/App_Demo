import 'package:app_demo/models/comment.dart';

import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/widgets/app_bar.dart';

class ReplyCommentView extends StatefulWidget {
  final Comment comment;

  const ReplyCommentView({super.key, required this.comment});

  @override
  State<ReplyCommentView> createState() => _ReplyCommentViewState();
}

class _ReplyCommentViewState extends State<ReplyCommentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: KAppBar(
        titleText: 'SeeQul',
        bgColor: Colors.white,
        spacing: 0.0,
        leadingView: GestureDetector(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox.square(
                  dimension: 32.0,
                  child: Image.asset(
                    'assets/icons/placeholder.png',
                  ),
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
        actionButtons: [],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const CircleAvatar(
                    radius: 18.0,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                ),
                wSpace(w: 8.0),
                const Text(
                  'Reply',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                
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
                              hintText: 'Add reply',
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
                      // wSpace(w: 16.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
