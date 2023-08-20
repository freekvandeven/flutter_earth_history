import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DividerLine extends HookWidget {
  const DividerLine({
    required this.scrollController,
    required this.yearStart,
    required this.yearEnd,
    super.key,
  });

  final ScrollController scrollController;
  final int yearStart;
  final int yearEnd;

  @override
  Widget build(BuildContext context) {
    var amountDividers = 40;
    var currentYear = useState(yearStart);
    useListenable(scrollController).addListener(() {
      var pixels = scrollController.position.pixels;
      var scrollHeight = scrollController.position.maxScrollExtent;
      var scrollPercentage = pixels / scrollHeight;
      var scrollYear = yearStart + scrollPercentage * (yearEnd - yearStart);
      currentYear.value = scrollYear.toInt();
    });
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(currentYear.value.abs().toString()),
            Text(
              currentYear.value < 0 ? 'BCE' : 'AD',
            ),
          ],
        ),
        Row(
          children: [
            for (var i = 0; i < amountDividers; i++) ...[
              Expanded(
                flex: 2,
                child: Container(
                  height: 1,
                  color: Colors.white,
                ),
              ),
              if (i != amountDividers - 1)
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 2,
                  ),
                ),
            ],
          ],
        ),
      ],
    );
  }
}

double calculateTextHeight(BuildContext context) => (TextPainter(
      text: const TextSpan(
        text: 'AD',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout())
        .size
        .height;
