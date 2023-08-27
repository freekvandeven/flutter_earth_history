import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/features/overview/widgets/menu.dart';
import 'package:flutter_earth_history/src/routes.dart';
import 'package:flutter_earth_history/src/services/history_periods.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverviewScreen extends HookConsumerWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var menuOpened = useState(false);
    var currentPeriod = useState(0);
    var periods = ref.watch(historyPeriodsProvider);
    var verticalDragging = useState(false);
    var verticalDragProgress = useState(0.0);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // layers of the periods
          GestureDetector(
            // detect swipe left and swipe right to update the current period
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                if (currentPeriod.value > 0) {
                  currentPeriod.value--;
                } else {
                  currentPeriod.value = periods.length - 1;
                }
              } else if (details.primaryVelocity! < 0) {
                if (currentPeriod.value < periods.length - 1) {
                  currentPeriod.value++;
                } else {
                  currentPeriod.value = 0;
                }
              }
            },
            onVerticalDragEnd: (details) {
              verticalDragProgress.value = 0.0;
              verticalDragging.value = false;
            },
            onVerticalDragStart: (details) {
              verticalDragging.value = true;
            },
            onVerticalDragUpdate: (details) async {
              // after 100 pixels of dragging, go to the period page
              verticalDragProgress.value =
                  verticalDragProgress.value - details.delta.dy / 100;
              if (verticalDragProgress.value > 1.0 && verticalDragging.value) {
                verticalDragProgress.value = 0.0;
                verticalDragging.value = false;
                await context.push(ProjectRoute.periodScreen.route);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    periods[currentPeriod.value].topColor,
                    periods[currentPeriod.value].bottomColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          if (menuOpened.value) ...[
            const MenuWidget(),
          ] else ...[
            // chevron down button to open the period page
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 8,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    height: 32,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        periods[currentPeriod.value].title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      // indicators of the periods
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.05,
                          bottom: size.height * 0.1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < periods.length; i++)
                              Container(
                                margin: const EdgeInsets.all(4),
                                width: i == currentPeriod.value ? 16 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: i == currentPeriod.value
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.5),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          // round icon button to open a menu
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: MediaQuery.of(context).padding.left + 8,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      menuOpened.value ? Icons.close : Icons.sort_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      menuOpened.value = !menuOpened.value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
