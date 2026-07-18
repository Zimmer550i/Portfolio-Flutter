import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Centralized analytics service replacing scattered logScreenEvent/logCustomEvent calls.
class AnalyticsService {
  static void logScreenView(String screenName) {
    try {
      FirebaseAnalytics.instance.logScreenView(screenName: screenName);
    } catch (e) {
      debugPrint('Analytics screen view error: $e');
    }
  }

  static void logCustomEvent(String name, {String? extra}) {
    try {
      final Map<String, Object> parameters = {
        'datetime': DateTime.now().toIso8601String(),
      };
      if (extra != null) {
        parameters['extra'] = extra;
      }
      FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters);
    } catch (e) {
      debugPrint('Analytics event error: $e');
    }
  }
}
