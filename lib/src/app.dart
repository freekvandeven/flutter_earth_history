import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';
import 'package:flutter_earth_history/src/routes.dart';
import 'package:flutter_earth_history/src/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localization = context.localizations;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      onGenerateTitle: (context) => localization.appTitle,
      theme: getTheme(),
      scrollBehavior:
          const CupertinoScrollBehavior().copyWith(scrollbars: false),
      routerConfig: ref.read(routerProvider),
    );
  }
}
