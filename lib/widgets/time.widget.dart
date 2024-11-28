import 'dart:async';

import 'package:agora/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AgoraTimer extends StatefulWidget {
  const AgoraTimer({super.key, this.minutes = 2});

  final int minutes;

  @override
  State<StatefulWidget> createState() => _AgoraTimerState();
}

class _AgoraTimerState extends State<AgoraTimer> {
  Stream<DateTime> tick(int minutes) async* {
    DateTime time = DateTime(0, 0, 0, 0, minutes, 0);

    while (time.minute > 0 || time.second > 0) {
      await Future<void>.delayed(const Duration(seconds: 1));
      time = time.subtract(const Duration(seconds: 1));
      yield time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: tick(widget.minutes),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final time = snapshot.data!;

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: AgoraText(text: '${time.minute}'),
                        ),
                        const Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: AgoraText(text: 'm', fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: AgoraText(text: ':'),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: AgoraText(text: '${time.second}'),
                        ),
                        const Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: AgoraText(text: 's', fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
