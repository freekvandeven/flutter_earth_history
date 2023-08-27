import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/features/overview/widgets/menu.dart';
import 'package:flutter_earth_history/src/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverviewScreen extends HookConsumerWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var menuOpened = useState(false);
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (menuOpened.value) ...[
            const MenuWidget(),
          ] else ...[
            // chevron down button to open the period page
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 8,
              child: GestureDetector(
                onTap: () async =>
                    context.push(ProjectRoute.periodScreen.route),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],

          // round icon button to open a menu
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: MediaQuery.of(context).padding.left + 8,
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
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
          ),
        ],
      ),
    );
  }
}
