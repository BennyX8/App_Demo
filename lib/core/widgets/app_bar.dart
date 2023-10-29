import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KAppBar extends AppBar {
  final String? titleText;
  final List<Widget>? actionButtons;
  final PreferredSizeWidget? bottomView;
  final Widget? leadingView;
  final VoidCallback? onPop;
  final double? height;
  final double? leadingViewWidth;
  final SystemUiOverlayStyle? uiOverlayStyle;
  final TextStyle? style;
  final double? spacing;
  final bool elevatePop;
  final Color popColor;

  KAppBar({
    super.key,
    this.titleText,
    this.actionButtons,
    this.bottomView,
    this.leadingView,
    this.height,
    this.onPop,
    this.uiOverlayStyle,
    this.leadingViewWidth,
    this.spacing,
    this.style,
    this.elevatePop = false,
    this.popColor = Colors.grey,
  }) : super(
          title: titleText != null
              ? Text(
                  titleText,
                  style: style ??
                      const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                )
              : null,
          actions: actionButtons,
          centerTitle: false,
          elevation: 0.0,
          toolbarHeight: height,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: uiOverlayStyle,
          bottom: bottomView,
          titleSpacing: spacing,
          leadingWidth: leadingViewWidth ?? 50,
          leading: leadingView ??
              (onPop != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor:
                            elevatePop ? Colors.black26 : Colors.transparent,
                        child: IconButton.filled(
                          splashRadius: 24,
                          onPressed: onPop,
                          icon: Icon(
                            Icons.keyboard_arrow_left_outlined,
                            color: popColor,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()),
        );
}
