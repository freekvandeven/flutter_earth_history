import 'package:flutter_earth_history/src/models/history_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyEventsProvider = StateProvider<List<HistoryEvent>>(
  (ref) => const [
    HistoryEvent(yearAfterBC: 1998, title: 'Birth of the creator of this app'),
    HistoryEvent(yearAfterBC: 2014, title: 'Creating of Flutter'),
  ],
);
