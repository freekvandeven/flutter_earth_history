import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox(
          height: size.width * 0.6,
          width: size.width * 0.6,
          child: const Placeholder(),
        ),
        SizedBox(height: size.height * 0.05),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // icon of timeline
            Icon(Icons.timeline),
            Text('Explore the timeline'),
          ],
        ),
        // divider line
        Divider(
          color: Colors.black,
          indent: size.width * 0.15,
          endIndent: size.width * 0.15,
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // icon of blocks
            Icon(Icons.grid_view),
            Text('View your collection'),
          ],
        ),
        // divider line
        Divider(
          color: Colors.black,
          indent: size.width * 0.15,
          endIndent: size.width * 0.15,
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // info icon
            Icon(Icons.info_outline),
            Text('About this app'),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
