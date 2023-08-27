import 'package:flutter/material.dart';

@immutable
class HistoryEra {
  const HistoryEra({
    required this.yearAfterBCStart,
    required this.yearAfterBCEnd,
    required this.title,
  });

  final int yearAfterBCStart;
  final int yearAfterBCEnd;
  final String title;
}
