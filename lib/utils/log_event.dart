import 'package:firebase_analytics_web/firebase_analytics_web.dart';

Future<void> logCustomEvent(String name, {String? extra}) async {
  // Create the parameters map
  Map<String, dynamic> parameters = {
    'datetime': DateTime.now().toIso8601String(),
  };

  // Add 'extra' parameter only if it is not null
  if (extra != null) {
    parameters['extra'] = extra;
  }

  // Log the event with the parameters
  await FirebaseAnalyticsWeb().logEvent(name: name, parameters: parameters);
}