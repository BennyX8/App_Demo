import 'package:flutter/material.dart';
import 'widgets/app_loading_view.dart';

Future<dynamic> showAppDialog(
  BuildContext context,
  Widget child,
) async {
  showDialog(
    context: context,
    barrierColor: Colors.white,
    builder: (context) {
      return child;
    },
  );
}

Future<dynamic> showLoadingDialog(
  BuildContext context,
) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0.9),
    builder: (context) {
      return const LoadingView();
    },
  );
}

Future<dynamic> showOverlay(BuildContext context, final Widget child,
    {bool? isDismissible}) async {
  showDialog(
    context: context,
    barrierDismissible: isDismissible ?? false,
    barrierColor: Colors.black.withOpacity(0.8),
    builder: (context) {
      return child;
    },
  );
}
