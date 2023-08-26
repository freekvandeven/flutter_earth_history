import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = context.localizations;
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.titleCollection),
      ),
      body: const Placeholder(),
    );
  }
}
