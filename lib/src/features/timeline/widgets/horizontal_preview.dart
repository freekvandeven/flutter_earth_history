import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/services/history_periods.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HorizontalPreviewSlider extends HookConsumerWidget {
  const HorizontalPreviewSlider({
    required this.scrollController,
    required this.yearStart,
    required this.yearEnd,
    super.key,
  });

  final ScrollController scrollController;
  final int yearStart;
  final int yearEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var historyPeriods = ref.watch(historyPeriodsProvider);
    var frameDragging = useState(false);
    var currentYear = useState(yearStart);
    var totalYears = yearEnd - yearStart;
    var amountOfDottedLines = 10;
    var currentPeriod = historyPeriods.firstWhere(
      (period) =>
          period.yearAfterBCStart <= currentYear.value &&
          period.yearAfterBCEnd >= currentYear.value,
      orElse: () => currentYear.value.isNegative
          ? historyPeriods.first
          : historyPeriods.last,
    );

    useListenable(scrollController).addListener(() {
      var pixels = scrollController.position.pixels;
      var scrollHeight = scrollController.position.maxScrollExtent;
      var scrollPercentage = pixels / scrollHeight;
      var scrollYear = yearStart + scrollPercentage * (yearEnd - yearStart);
      currentYear.value = scrollYear.toInt();
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        var scrollViewPercentage = scrollController.position.viewportDimension /
            scrollController.position.maxScrollExtent;
        var frameWidth = constraints.maxWidth * scrollViewPercentage;
        var positionOfFrame = max(
          0.0,
          min(
            constraints.maxWidth - frameWidth,
            (constraints.maxWidth - frameWidth) *
                (currentYear.value - yearStart) /
                totalYears,
          ),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentPeriod.title,
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 64, 64),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: GestureDetector(
                  onHorizontalDragDown: (details) {
                    // if the drag starts within the frame container
                    // set the frameDragging to true
                    if (details.localPosition.dx >= positionOfFrame &&
                        details.localPosition.dx <=
                            positionOfFrame + frameWidth) {
                      frameDragging.value = true;
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    if (frameDragging.value) {
                      // update the position of the frame container
                      // get the delta x movement and convert it to a percentage
                      var movementX = details.delta.dx /
                          constraints.maxWidth *
                          scrollController.position.maxScrollExtent;
                      scrollController
                          .jumpTo(scrollController.position.pixels + movementX);
                    }
                  },
                  onTapDown: (details) {
                    // if the position that is clicked is
                    // not within the framecontainer
                    if (details.localPosition.dx < positionOfFrame ||
                        details.localPosition.dx >
                            positionOfFrame + frameWidth) {
                      var newPosition = details.localPosition.dx /
                          constraints.maxWidth *
                          scrollController.position.maxScrollExtent;
                      scrollController.jumpTo(newPosition);
                    }
                  },
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        color: Colors.transparent,
                      ),
                      // framecontainer which shows the visible part of timeline
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          left: positionOfFrame,
                        ),
                        width: frameWidth,
                        child: Column(
                          children: [
                            // a vertical dotted line
                            for (var i = 0; i < amountOfDottedLines; i++) ...[
                              Expanded(
                                child: Container(
                                  width: 0.5,
                                  color: Colors.white,
                                ),
                              ),
                              const Expanded(
                                child: SizedBox.shrink(),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
