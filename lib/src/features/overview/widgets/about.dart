import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutAppDialog extends HookWidget {
  const AboutAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var packageInfo = useState<PackageInfo?>(null);
    var size = MediaQuery.of(context).size;
    useEffect(
      () {
        unawaited(
          PackageInfo.fromPlatform().then((value) => packageInfo.value = value),
        );
        return;
      },
      [],
    );
    return Column(
      children: [
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/history.png',
                    height: 80,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Earth History',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        packageInfo.value != null
                            ? 'Version ${packageInfo.value!.version}'
                            : '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        // copyright
                        '© 2023 Freek van de Ven',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 24),
                child: Text(
                  'Flutter Earth history is a visual showcase of the different '
                  'periods in world history. '
                  'Built with Flutter by Freek van de Ven',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const Text(
                'Learn more at freekvandeven.nl. To see the source code for '
                'this app, please visit the Flutter Earth History github repo',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 30),
                child: Text(
                  'Artwork in this app is generated by midjourney',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('View Licenses'),
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}