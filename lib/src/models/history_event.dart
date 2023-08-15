import 'package:flutter/material.dart';

@immutable
class HistoryEvent {
  const HistoryEvent({
    required this.yearAfterBC,
    required this.title,
  });

  final int yearAfterBC;
  final String title;
}
