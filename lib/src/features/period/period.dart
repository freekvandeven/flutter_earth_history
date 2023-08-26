import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';

class PeriodScreen extends StatelessWidget {
  const PeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = context.localizations;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.titlePeriod),
      ),
      body: const Placeholder(),
    );
  }
}
