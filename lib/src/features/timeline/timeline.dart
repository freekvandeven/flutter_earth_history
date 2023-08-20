import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_earth_history/src/features/timeline/widgets/divider.dart';
import 'package:flutter_earth_history/src/features/timeline/widgets/information_card.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';
import 'package:flutter_earth_history/src/services/history_events.dart';
import 'package:flutter_earth_history/src/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GlobalTimelineScreen extends HookConsumerWidget {
  const GlobalTimelineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var localization = context.localizations;

    var scrollController = useScrollController();
    var historyEvents = ref.watch(historyEventsProvider);

    var yearStart = -3000;
    var yearEnd = 2000;
    var totalYears = yearEnd - yearStart;
    var yearPixelLength = 1.0;
    var eventDetectionRadius = 10.0;
    var yearInterval = 100;
    var blockHeight = yearInterval * yearPixelLength;
    var yearActive = useState<int?>(null);
    var fadingYear = useState<int?>(null);

    // i need a flutter_hooks animation for sliding in the information card
    // when a year is active

    // var animationController = useAnimationController(
    //   duration: const Duration(milliseconds: 500),
    // );
    // var animation = useAnimation(
    //   Tween<double>(begin: 0, end: 1).animate(animationController),
    // );

    useListenable(scrollController).addListener(() {
      var currentYear = yearStart +
          scrollController.position.pixels /
              scrollController.position.maxScrollExtent *
              totalYears;
      // get all the events that are within the detection radius
      var events = historyEvents
          .where(
            (event) =>
                event.yearAfterBC - currentYear < eventDetectionRadius &&
                event.yearAfterBC - currentYear > -eventDetectionRadius,
          )
          .toList();
      if (events.isEmpty) {
        if (yearActive.value != null) {
          fadingYear.value = yearActive.value;
          unawaited(HapticFeedback.selectionClick());
          yearActive.value = null;
          // remove the fading year after 1 second
          Future.delayed(
            const Duration(seconds: 1),
            () {
              fadingYear.value = null;
            },
          );
        }
        return;
      }
      // take the event that is closest to the current year
      var closestEvent = events.reduce(
        (a, b) => (a.yearAfterBC - currentYear).abs() <
                (b.yearAfterBC - currentYear).abs()
            ? a
            : b,
      );
      if (yearActive.value != closestEvent.yearAfterBC) {
        yearActive.value = closestEvent.yearAfterBC;
        fadingYear.value = null;
        unawaited(HapticFeedback.heavyImpact());
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.titleTimeline),
        centerTitle: true,
        backgroundColor: ProjectTheme.backgroundColor,
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
                    SizedBox(
                      height: size.height * 0.5,
                    ),
                    for (var i = 0; i <= totalYears; i += yearInterval) ...[
                      Container(
                        height: blockHeight,
                        width: size.width,
                        margin: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          (yearStart + i).abs().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    SizedBox(
                      height: size.height * 0.5 -
                          yearInterval * yearPixelLength -
                          calculateRemainingBlockHeight(
                            context,
                            blockHeight,
                          ),
                    ),
                  ],
                ),
                for (var event in historyEvents) ...[
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.2 -
                          (event.yearAfterBC == yearActive.value ? 2.5 : 0),
                      top: size.height * 0.5 +
                          (event.yearAfterBC == yearActive.value ? 2.5 : 5) +
                          (event.yearAfterBC + yearStart.abs()) *
                              yearPixelLength,
                    ),
                    child: Container(
                      width: event.yearAfterBC == yearActive.value ? 10 : 5,
                      height: event.yearAfterBC == yearActive.value ? 10 : 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ProjectTheme.eventColor,
                        // add a gradient shadow around the circle
                        boxShadow: event.yearAfterBC == yearActive.value
                            ? [
                                const BoxShadow(
                                  color: ProjectTheme.eventAccentColor,
                                  blurRadius: 10,
                                  spreadRadius: 4,
                                ),
                              ]
                            : null,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // year divider at half the page with the current year
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.5 -
                  calculateTextHeight(context) +
                  calculateLabelTextHeight(context) / 2,
            ),
            child: DividerLine(
              yearStart: yearStart,
              yearEnd: yearEnd,
              scrollController: scrollController,
            ),
          ),
          if (fadingYear.value != null || yearActive.value != null) ...[
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.02,
                right: size.width * 0.02,
              ),
              width: double.infinity,
              height: size.height * 0.1,
              child: EventInformationCard(
                event: historyEvents.firstWhere(
                  (event) =>
                      event.yearAfterBC == yearActive.value ||
                      event.yearAfterBC == fadingYear.value,
                ),
              ),
            ),
          ],

          // horizontal timeline preview
        ],
      ),
    );
  }
}

double calculateRemainingBlockHeight(
  BuildContext context,
  double blockHeight,
) =>
    blockHeight - calculateLabelTextHeight(context) / 2;

double calculateLabelTextHeight(BuildContext context) => (TextPainter(
      text: const TextSpan(
        text: '0',
      ),
      textDirection: TextDirection.ltr,
    )..layout())
        .size
        .height;
