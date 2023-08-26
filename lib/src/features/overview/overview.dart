import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/features/overview/widgets/menu.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';
import 'package:flutter_earth_history/src/routes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class OverviewScreen extends HookWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var menuOpened = useState(false);
    var localization = context.localizations;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (menuOpened.value) ...[
            // semi transparant background behind the menu
            Container(
              color: Colors.black.withOpacity(0.3),
              width: size.width,
              height: size.height,
            ),
            const MenuWidget(),
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              right: MediaQuery.of(context).padding.right + 8,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    localization.languageSwitch,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
          if (!menuOpened.value) ...[
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
