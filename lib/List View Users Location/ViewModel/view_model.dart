import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';


/* Launch Map URl*/

_launchMapsUrl(double latitude, double longitude, double currentLat, double currentLng) async {
  Uri url = Uri.parse("https://www.google.com/maps/dir/?api=1&origin=$currentLat,$currentLng&destination=$latitude,$longitude&travelmode=driving&dir_action=navigate");
  _launchUrl(url);
}

/* Launch URl*/

_launchUrl(Uri url) async {
  if (await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

/* Navigating to Google Map*/

redirectToMap(
    String latitude,
    String longitude,
    double currentLat,
    double currentLng){
  try {
    _launchMapsUrl(double.parse(latitude), double.parse(longitude), currentLat, currentLng);
  } catch (e, _) {
    if (kDebugMode) {
      print("error----->$_");
    }
  }

}

