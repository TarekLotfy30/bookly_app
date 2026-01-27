import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> launchCustomUrl(BuildContext context, String? url) async {
  if (url == null || url.isEmpty) {
    if (context.mounted) {
      customSnackBar(context, 'Invalid URL');
    }
    return;
  }

  final Uri uri = Uri.parse(url);

  try {
    final bool launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && context.mounted) {
      customSnackBar(context, 'Cannot launch $url');
    }
  } on Exception catch (_) {
    if (context.mounted) {
      customSnackBar(context, 'Error opening link');
    }
  }
}
