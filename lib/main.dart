import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_earth_history/src/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const ProviderScope(child: MyApp()));
}
