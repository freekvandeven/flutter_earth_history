import 'package:flutter_earth_history/src/models/history_period.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyPeriodsProvider = StateProvider<List<HistoryPeriod>>(
  (ref) => const [
    HistoryPeriod(
      yearAfterBCStart: -3000,
      yearAfterBCEnd: -2001,
      title: 'Ancient Civilizations',
    ),
    HistoryPeriod(
      yearAfterBCStart: -2000,
      yearAfterBCEnd: 476,
      title: 'Classical Era',
    ),
    HistoryPeriod(
      yearAfterBCStart: 477,
      yearAfterBCEnd: 1453,
      title: 'Middle Ages',
    ),
    HistoryPeriod(
      yearAfterBCStart: 1454,
      yearAfterBCEnd: 1789,
      title: 'Renaissance and Enlightenment',
    ),
    HistoryPeriod(
      yearAfterBCStart: 1790,
      yearAfterBCEnd: 1914,
      title: 'Modern Era',
    ),
    HistoryPeriod(
      yearAfterBCStart: 1915,
      yearAfterBCEnd: 2000,
      title: 'Contemporary Era',
    ),
  ],
);
