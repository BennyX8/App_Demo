import 'package:flutter/material.dart';
import '../enum.dart';

class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final String? text;
  final AppButtonType? type;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Color? iconColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final TextStyle? style;
  final IconData? icon;
  final double? iconSize;
  final double? iconPadding;
  final bool? loading;

  final Positions positions;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.positions = Positions.before,
    this.type = AppButtonType.primary,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.iconPadding,
    this.style,
    this.color,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.loading,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  Widget kIcon() {
    return widget.icon != null
        ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.iconPadding ?? 5,
            ),
            child: Icon(
              widget.icon,
              color: widget.iconColor ?? Colors.white,
              size: widget.iconSize,
            ),
          )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 45.0,
      width: widget.width,
      child: MaterialButton(
        elevation: 0.0,
        color: buttonColor,
        highlightElevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
          side: BorderSide(
            color: widget.borderColor ?? buttonOutlineColor,
          ),
        ),
        onPressed: widget.onPressed,
        child: widget.loading != null && widget.loading!
            ? const SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.positions == Positions.before
                      ? kIcon()
                      : const SizedBox.shrink(),
                  widget.positions == Positions.extended ||
                          widget.positions == Positions.leading
                      ? Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: widget.positions == Positions.leading
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            children: [
                              widget.text == null
                                  ? const SizedBox.shrink()
                                  : Text(
                                      widget.text ?? '',
                                      style: widget.style ??
                                          TextStyle(
                                            color: widget.textColor ??
                                                Colors.white.withOpacity(0.8),
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                              kIcon()
                            ],
                          ),
                        )
                      : widget.text == null
                          ? const SizedBox.shrink()
                          : Text(
                              widget.text!,
                              style: widget.style ??
                                  TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                  widget.positions == Positions.after
                      ? kIcon()
                      : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }

  Color get buttonColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return widget.color ?? Theme.of(context).primaryColor;

      case AppButtonType.outline:
        return widget.color ?? Colors.transparent;

      case AppButtonType.text:
        return widget.color ?? Colors.transparent;

      case AppButtonType.secondary:
        return widget.color ?? Theme.of(context).primaryColor;

      default:
        return Theme.of(context).primaryColor;
    }
  }

  Color get buttonOutlineColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return Theme.of(context).primaryColor;

      case AppButtonType.outline:
        return Theme.of(context).primaryColor;

      case AppButtonType.text:
        return Colors.transparent;

      default:
        return Theme.of(context).primaryColor;
    }
  }

  Color get textColor {
    switch (widget.type) {
      case AppButtonType.primary:
        return Colors.white;

      case AppButtonType.outline:
        return Colors.grey;

      case AppButtonType.text:
        return Colors.orange;

      default:
        return Colors.orange;
    }
  }
}
