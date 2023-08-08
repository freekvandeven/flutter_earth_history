
import 'package:flutter/material.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var context = 
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    
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
                    Locale('nl', ''),
                  ],
                  onGenerateTitle: (BuildContext context) =>
                      AppLocalizations.of(context)!.appTitle,

                  theme: getTheme(),
                  scrollBehavior: const CupertinoScrollBehavior()
                      .copyWith(scrollbars: false),
                  routerConfig: ref.read(routerProvider),
                ),
  }
}
