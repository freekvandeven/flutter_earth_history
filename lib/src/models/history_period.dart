import 'package:flutter/material.dart';

@immutable
class HistoryPeriod {
  const HistoryPeriod({
    required this.yearAfterBCStart,
    required this.yearAfterBCEnd,
    required this.title,
  });

  final int yearAfterBCStart;
  final int yearAfterBCEnd;
  final String title;
}
