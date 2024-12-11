import 'package:ebook/core/utils/function/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, 'can\'t launch the url: $url');
    }
  }
}
