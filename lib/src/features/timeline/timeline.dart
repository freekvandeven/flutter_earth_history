import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';
import 'package:flutter_earth_history/src/services/history_events.dart';
import 'package:flutter_earth_history/src/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalTimelineScreen extends HookConsumerWidget {
  const GlobalTimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var localization = context.localizations;
    var scrollController = useScrollController();
    var historyEvents = ref.watch(historyEventsProvider);
    var yearStart = -3000;
    var yearEnd = 2023;
    var totalYears = yearEnd - yearStart;
    var yearPixelLength = 1.0;
    var currentYear = 1000.0;
    debugPrint(totalYears.toString());
    debugPrint(currentYear.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.titleTimeline),
        centerTitle: true,
      ),
      backgroundColor: ProjectTheme.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: scrollController,
            child: Stack(
              children: [
                Column(
                  children: [
                    for (var i = 0; i < 30; i++) ...[
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ],
                ),
                for (var event in historyEvents) ...[
                  Positioned(
                    left: 20,
                    top: event.yearAfterBC * yearPixelLength,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // year divider at half the page with the current year

          // horizontal timeline preview
        ],
      ),
    );
  }
}
