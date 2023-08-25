import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.width * 0.8,
          width: size.width * 0.8,
          child: const Placeholder(),
        ),
        const Text('Explore the timeline'),
        const Text('View your collection'),
        const Text('About this app'),
      ],
    );
  }
}
