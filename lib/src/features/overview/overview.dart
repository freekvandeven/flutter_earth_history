import 'package:flutter/material.dart';
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
          // round icon button to open a menu
          Positioned(
            // safearea + 16px
            top: MediaQuery.of(context).padding.top + 8,
            left: MediaQuery.of(context).padding.left + 8,
            child: IconButton(
              // black background
              color: Colors.black,

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
    );
  }
}
