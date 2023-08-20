import 'package:flutter/material.dart';
import 'package:flutter_earth_history/src/models/history_event.dart';

class EventInformationCard extends StatelessWidget {
  const EventInformationCard({
    required this.event,
    super.key,
  });

  final HistoryEvent event;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;
          return Container(
            width: width,
            height: height,
            color: const Color.fromARGB(255, 197, 181, 181),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.2,
                  ),
                  width: width * 0.22,
                  decoration: const BoxDecoration(
                    // border on the right side
                    border: Border(
                      right: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.yearAfterBC.abs().toString(),
                        style: const TextStyle(
                          fontSize: 27,
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      Text(
                        event.yearAfterBC < 0 ? 'BCE' : 'AD',
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.3,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: width * 0.04),
              ],
            ),
          );
        },
      );
}
