import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/features/overview/widgets/about.dart';
import 'package:flutter_earth_history/src/global/extensions/localization.dart';
import 'package:flutter_earth_history/src/routes.dart';
import 'package:go_router/go_router.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = context.localizations;
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
        GestureDetector(
          onTap: () async =>
              context.push(ProjectRoute.globalTimelineScreen.route),
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // icon of timeline
                const Icon(Icons.timeline),
                Text(localization.menuExploreTimeline),
              ],
            ),
          ),
        ),
        // divider line
        Divider(
          height: 1.0,
          color: Colors.black,
          indent: size.width * 0.15,
          endIndent: size.width * 0.15,
        ),

        GestureDetector(
          onTap: () async => context.push(ProjectRoute.collectionScreen.route),
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // icon of blocks
                const Icon(Icons.grid_view),
                Text(localization.menuExploreCollection),
              ],
            ),
          ),
        ),
        // divider line
        Divider(
          height: 1.0,
          color: Colors.black,
          indent: size.width * 0.15,
          endIndent: size.width * 0.15,
        ),
        GestureDetector(
          // show the app info dialog
          onTap: () async => showDialog(
            // the dialog should be a small as possible
            context: context,
            builder: (_) => const AboutAppDialog(),
          ),
          behavior: HitTestBehavior.translucent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // info icon
                const Icon(Icons.info_outline),
                Text(localization.menuExploreAbout),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
