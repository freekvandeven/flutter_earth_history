import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/features/overview/widgets/menu.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OverviewScreen extends HookWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var menuOpened = useState(false);
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (menuOpened.value) ...[
            const MenuWidget(),
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
