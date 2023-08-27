import 'package:flutter_earth_history/src/models/history_eras.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyErasProvider = StateProvider<List<HistoryEra>>(
  (ref) => const [
    HistoryEra(
      yearAfterBCStart: -3000,
      yearAfterBCEnd: -2001,
      title: 'Ancient Civilizations',
    ),
    HistoryEra(
      yearAfterBCStart: -2000,
      yearAfterBCEnd: 476,
      title: 'Classical Era',
    ),
    HistoryEra(
      yearAfterBCStart: 477,
      yearAfterBCEnd: 1453,
      title: 'Middle Ages',
    ),
    HistoryEra(
      yearAfterBCStart: 1454,
      yearAfterBCEnd: 1789,
      title: 'Renaissance and Enlightenment',
    ),
    HistoryEra(
      yearAfterBCStart: 1790,
      yearAfterBCEnd: 1914,
      title: 'Modern Era',
    ),
    HistoryEra(
      yearAfterBCStart: 1915,
      yearAfterBCEnd: 2000,
      title: 'Contemporary Era',
    ),
  ],
);
