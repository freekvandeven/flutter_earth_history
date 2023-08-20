import 'package:flutter_earth_history/src/models/history_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyEventsProvider = StateProvider<List<HistoryEvent>>(
  (ref) => const [
    HistoryEvent(
      yearAfterBC: -3000,
      title: 'Earliest known writing system, Sumerians',
    ),
    HistoryEvent(yearAfterBC: -2575, title: 'Great Pyramid of Giza completed'),
    HistoryEvent(
      yearAfterBC: -776,
      title: 'First recorded Olympic Games in ancient Greece',
    ),
    HistoryEvent(yearAfterBC: -753, title: 'Traditional founding of Rome'),
    HistoryEvent(yearAfterBC: -551, title: 'Birth of Confucius'),
    HistoryEvent(yearAfterBC: -490, title: 'Battle of Marathon'),
    HistoryEvent(yearAfterBC: -399, title: 'Death of Socrates'),
    HistoryEvent(yearAfterBC: -336, title: 'Alexander the Great becomes king'),
    HistoryEvent(yearAfterBC: -221, title: 'Qin Dynasty unifies China'),
    HistoryEvent(yearAfterBC: -44, title: 'Assassination of Julius Caesar'),
    HistoryEvent(yearAfterBC: 4, title: 'Birth of Jesus Christ'),
    HistoryEvent(yearAfterBC: 476, title: 'Fall of the Western Roman Empire'),
    HistoryEvent(yearAfterBC: 632, title: 'Death of Prophet Muhammad'),
    HistoryEvent(yearAfterBC: 1066, title: 'Norman Conquest of England'),
    HistoryEvent(yearAfterBC: 1215, title: 'Signing of the Magna Carta'),
    HistoryEvent(yearAfterBC: 1439, title: 'Invention of the printing press'),
    HistoryEvent(
      yearAfterBC: 1492,
      title: 'Christopher Columbus reaches the Americas',
    ),
    HistoryEvent(yearAfterBC: 1517, title: "Martin Luther's 95 Theses"),
    HistoryEvent(
      yearAfterBC: 1582,
      title: 'Introduction of the Gregorian calendar',
    ),
    HistoryEvent(
      yearAfterBC: 1607,
      title: 'Establishment of Jamestown, the first English colony in America',
    ),
    HistoryEvent(
      yearAfterBC: 1776,
      title: 'Declaration of Independence in the United States',
    ),
    HistoryEvent(yearAfterBC: 1789, title: 'French Revolution begins'),
    HistoryEvent(yearAfterBC: 1861, title: 'American Civil War begins'),
    HistoryEvent(yearAfterBC: 1914, title: 'Start of World War I'),
    HistoryEvent(yearAfterBC: 1917, title: 'Russian Revolution'),
    HistoryEvent(
      yearAfterBC: 1929,
      title: 'Wall Street Crash, beginning of the Great Depression',
    ),
    HistoryEvent(yearAfterBC: 1945, title: 'End of World War II'),
    HistoryEvent(
      yearAfterBC: 1947,
      title: 'Independence and partition of India',
    ),
    HistoryEvent(
      yearAfterBC: 1959,
      title: 'Cuban Revolution led by Fidel Castro',
    ),
    HistoryEvent(yearAfterBC: 1969, title: 'Apollo 11 moon landing'),
    HistoryEvent(yearAfterBC: 1989, title: 'Fall of the Berlin Wall'),
    HistoryEvent(yearAfterBC: 1998, title: 'Birth of the creator of this app'),
  ],
);
