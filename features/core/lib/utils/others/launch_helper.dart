import 'package:url_launcher/url_launcher.dart';

abstract class LaunchHelper {
  static void launchCall(String? phoneNumber) async {
    if (phoneNumber == null || phoneNumber.isEmpty) return;
    return _launch('tel:$phoneNumber');
  }

  static void launchMail(String? email) async {
    if (email == null || email.isEmpty) return;
    return _launch('mailto:$email');
  }

  static Future<void> launchLink(String? url) async {
    if (url == null || url.isEmpty) return;
    return await _launch(url);
  }

  static Future<void> _launch(String uriValue) async {
    try {
      final uri = Uri.parse(uriValue);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {}
  }
}
