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
        alignment: Alignment.center,
        children: [
          if (menuOpened.value) ...[
            // semi transparant background behind the menu
            Container(
              color: Colors.black.withOpacity(0.3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                  child: const Text(
                    'Switch language',
                    style: TextStyle(color: Colors.white),
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
