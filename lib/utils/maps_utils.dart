import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Uri uri(double latitude, double longitude) {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    final uri = Uri.parse(googleUrl);
    return uri;
  }

  static Future<void> openMap(double latitude, double longitude) async {
    final link = uri(latitude, longitude);
    if (await canLaunchUrl(link)) {
      await launchUrl(link);
    } else {
      throw 'Could not open the map.';
    }
  }
}
