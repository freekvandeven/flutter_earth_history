import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DividerLine extends HookWidget {
  const DividerLine({
    required this.scrollController,
    super.key,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    var amountDividers = 50;
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < amountDividers; i++) ...[
              Expanded(
                flex: 3,
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              if (i != amountDividers)
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
