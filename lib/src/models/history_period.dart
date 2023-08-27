import 'package:flutter/material.dart';

@immutable
class HistoryPeriod {
  const HistoryPeriod({
    required this.topColor,
    required this.bottomColor,
    required this.title,
    required this.description,
    required this.location,
    required this.yearAfterBCStart,
    required this.yearAfterBCEnd,
    required this.overlayAssetLocation,
    required this.titleAssetLocation,
    required this.iconAssetLocation,
  });

  final Color topColor;
  final Color bottomColor;
  final String title;
  final String description;
  final String location;
  final int yearAfterBCStart;
  final int yearAfterBCEnd;
  final String overlayAssetLocation;
  final String titleAssetLocation;
  final String iconAssetLocation;
}
