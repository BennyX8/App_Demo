import 'package:app_demo/core/constants.dart';
import 'package:app_demo/core/strings.dart';
import 'package:app_demo/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/comments_view.dart';
import '../widgets/less_link.dart';
import '../widgets/menu_icon.dart';
import '../widgets/more_link.dart';
import '../widgets/reaction_button.dart';

class FeedsView extends StatefulWidget {
  const FeedsView({
    super.key,
  });

  @override
  State<FeedsView> createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  bool showClipper = false;
  bool isTextExpanded = false;
  bool isHidden = false;

  String caption = dummy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/gym.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        AnimatedPositioned(
          duration: 300.ms,
          left: isHidden ? -MediaQuery.of(context).size.width : 12.0,
          bottom: 12.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: IntrinsicHeight(
                    child: AnimatedContainer(
                      duration: 300.ms,
                      padding: const EdgeInsets.fromLTRB(18, 12, 12, 12),
                      decoration: BoxDecoration(
                        color: const Color(0xBB4C4243),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFC4C4C4),
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: showClipper && isTextExpanded,
                            child: LessLink(
                              onTap: () {
                                if (isTextExpanded) {
                                  setState(() {
                                    isTextExpanded = false;
                                  });
                                }
                              },
                            ),
                          ),
                          hSpace(h: 4),
                          Expanded(
                            child: Text(
                              formatCaption,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: isTextExpanded ? 20.0 : 14.0,
                              ),
                            ),
                          ),
                          hSpace(h: 12.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Expanded(
                                child: Text(
                                  '27 Oct. 2020 @5:23pm',
                                  style: TextStyle(
                                    color: Color(0xFFE5A5A5),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: showClipper && !isTextExpanded,
                                child: MoreLink(
                                  onTap: () {
                                    if (!isTextExpanded) {
                                      setState(() {
                                        isTextExpanded = true;
                                      });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Horizontal Space
                wSpace(w: 10),

                SizedBox(
                  width: 60.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: SizedBox.square(
                                    dimension: 32.0,
                                    child: Image.asset(
                                      'assets/icons/profile_img.png',
                                    ),
                                  ),
                                ),
                                ReactionButton(
                                  asset: 'assets/svgs/book.svg',
                                  onTap: () {},
                                ),
                                ReactionButton(
                                  asset: 'assets/svgs/chat.svg',
                                  count: '45k',
                                  onTap: () {
                                    showComments();
                                  },
                                ),
                                ReactionButton(
                                  asset: 'assets/svgs/heart.svg',
                                  count: '45k',
                                  onTap: () {},
                                ),
                                ReactionButton(
                                  asset: 'assets/svgs/share.svg',
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: isHidden ? 0.0 : 1.0,
                            duration: 100.ms,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHidden = true;
                                });
                              },
                              child: SizedBox(
                                height: 45.0,
                                width: 45.0,
                                child: RotatedBox(
                                  quarterTurns: 0,
                                  child: Card(
                                    color: const Color(0x35FFBB00),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/toggle.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: -3,
          child: AnimatedOpacity(
            duration: 100.ms,
            opacity: isHidden ? 1.0 : 0.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isHidden = false;
                });
              },
              child: SizedBox(
                height: 45.0,
                width: 45.0,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Card(
                    color: const Color(0x35FFBB00),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/toggle.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: PopupMenuButton(
            color: Colors.white,
            child: const MenuIcon(),
            itemBuilder: (context) {
              return items
                  .map(
                    (e) => PopupMenuItem(
                      child: ListTile(
                        title: Text(
                          e.title,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        leading: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Image.asset(
                            e.iconPath,
                            width: 20.0,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList();
            },
          ),
        ),
      ],
    );
  }

  String get formatCaption {
    if (caption.length > 150) {
      setState(() {
        showClipper = true;
      });
      if (isTextExpanded) {
        return caption;
      } else {
        return caption.substring(0, 150);
      }
    } else {
      return caption;
    }
  }

  showComments() async {
    await showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAlias,
      isScrollControlled: true,
      useSafeArea: true,
      constraints: BoxConstraints.loose(
        Size(MediaQuery.of(context).size.width, 600),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return const CommentsView();
      },
    );
  }
}
