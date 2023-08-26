import 'dart:convert';

import 'package:flutter_earth_history/src/models/application_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final applicationConfigProvider = StateNotifierProvider<
    ApplicationConfigurationService, ApplicationConfiguration>(
  (ref) => BeerApplicationConfigurationService(),
);

abstract class ApplicationConfigurationService
    extends StateNotifier<ApplicationConfiguration> {
  ApplicationConfigurationService._()
      : super(
          ApplicationConfiguration.defaultConfiguration(),
        );

  Future<void> loadApplicationSettings();

  Future<void> saveApplicationSettings(ApplicationConfiguration config);
}

class BeerApplicationConfigurationService
    extends StateNotifier<ApplicationConfiguration>
    implements ApplicationConfigurationService {
  BeerApplicationConfigurationService()
      : super(
          ApplicationConfiguration.defaultConfiguration(),
        );

  static String settingsKey = 'settings';

  @override
  Future<void> loadApplicationSettings() async {
    var prefs = await SharedPreferences.getInstance();
    var settings = prefs.getString(settingsKey);
    if (settings != null) {
      var config = ApplicationConfiguration.fromJson(
        jsonDecode(settings),
      );
      state = config;
    }
  }

  @override
  Future<void> saveApplicationSettings(ApplicationConfiguration config) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(settingsKey, jsonEncode(config));
    state = config;
  }
}
