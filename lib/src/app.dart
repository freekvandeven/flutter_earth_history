import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';
import 'package:flutter_earth_history/src/routes.dart';
import 'package:flutter_earth_history/src/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('nl', ''), // Dutch, no country code
        ],
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        theme: getTheme(),
        scrollBehavior:
            const CupertinoScrollBehavior().copyWith(scrollbars: false),
        routerConfig: ref.watch(routerProvider),
      );
}
