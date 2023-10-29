import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String hint;
  final bool loading;
  final double? height;
  final double borderRadius;
  final bool isOptional;
  final bool obscure;
  final Widget? suffix;
  final IconData? prefix;
  final double? prefixSize;
  final Color? borderColor;
  final int? minLines;
  final int? maxLines;
  final TextCapitalization? capitalization;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final bool? editable;

  const AppTextField({
    super.key,
    required this.controller,
    this.inputType,
    this.inputAction,
    required this.hint,
    this.onChange,
    this.loading = false,
    this.borderColor,
    this.borderRadius = 8.0,
    this.isOptional = true,
    this.height,
    this.suffix,
    this.prefixSize,
    this.prefix,
    this.obscure = false,
    this.capitalization,
    this.validator,
    this.minLines,
    this.maxLines,
    this.editable,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: widget.height,
        child: TextFormField(
          controller: widget.controller,
          textInputAction: widget.inputAction,
          style: const TextStyle(
            fontSize: 15.0,
          ),
          keyboardType: widget.inputType,
          validator: widget.validator,
          autocorrect: false,
          enabled: widget.editable,
          spellCheckConfiguration: const SpellCheckConfiguration.disabled(),
          enableSuggestions: true,
          obscureText: obscureText,
          maxLines: widget.maxLines ?? 1,
          minLines: widget.minLines ?? 1,
          onChanged: widget.onChange,
          textCapitalization: widget.capitalization ?? TextCapitalization.none,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            hintText: widget.hint,
            prefixIcon: widget.prefix != null
                ? Icon(widget.prefix, size: widget.prefixSize ?? 20.0)
                : null,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }

  Widget? get suffixIcon {
    if (widget.obscure) {
      return IconButton(
        splashRadius: 20.0,
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      );
    } else {
      return widget.suffix;
    }
  }
}
