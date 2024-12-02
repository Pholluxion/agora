import 'dart:math';

import 'package:agora/core/core.dart';
import 'package:agora/widgets/widgets.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: const AgoraText(text: 'Asamblea de bienvenida', fontSize: 16),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      const AgoraText(
                        text: 'Asamblea de bienvenida en proceso',
                        fontSize: 20,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 8),
                      const AgoraText(
                        text:
                            'Sigue las intervenciones en tiempo real, solicita la palabra y consulta las reglas de participación. ',
                        fontSize: 16,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 3,
                              child: OutlinedButton(
                                onPressed: () {
                                  _showRulesDialog(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.rule, size: 14, color: AppTheme.textColor),
                                    const AgoraText(
                                      text: 'Reglas ',
                                      fontSize: 12,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              flex: 4,
                              child: ElevatedButton(
                                onPressed: () {
                                  _upsDialog(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.mic, size: 14, color: AppTheme.textColor),
                                    const AgoraText(
                                      text: 'Solicitar la palabra',
                                      fontSize: 12,
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Flexible(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AgoraText(
                              text: 'Tiempo restante',
                              fontSize: 16,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                            AgoraTimer(fontSize: 40),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        flex: 2,
                        child: Card(
                          color: AppTheme.emphasisColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AgoraAvatar(image: _getRandomAvatar(), radius: 30),
                                const SizedBox(height: 8),
                                AgoraText(
                                  text: faker.person.name(),
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                ),
                                const AgoraText(
                                  text: 'Hablando',
                                  fontSize: 12,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AgoraAvatar(
                                image: _getRandomAvatar(),
                                radius: 35,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AgoraText(
                                    text: faker.person.name(),
                                    fontSize: 14,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  AgoraText(
                                    text: 'Hace ${faker.randomGenerator.integer(20)} minutos',
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(color: AppTheme.textColor),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AgoraText(
                              text: faker.lorem.sentences(3).join(' '),
                              fontSize: 16,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(width: 8),
                              IconButton(
                                icon: Badge.count(
                                  count: faker.randomGenerator.integer(10),
                                  alignment: Alignment.centerLeft,
                                  offset: const Offset(-5, 0),
                                  backgroundColor: AppTheme.textColor,
                                  textColor: AppTheme.backgroundColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.thumb_up, color: AppTheme.emphasisColor),
                                  ),
                                ),
                                onPressed: () {
                                  _upsDialog(context);
                                },
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.thumb_down),
                                onPressed: () {
                                  _upsDialog(context);
                                },
                              ),
                              const Spacer(),
                              OutlinedButton(
                                onPressed: () {
                                  _upsDialog(context);
                                },
                                child: const Text('Responder'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  AssetGenImage _getRandomAvatar() {
    final random = Random();

    final avatar = random.nextInt(4);

    switch (avatar) {
      case 0:
        return Assets.images.avatar1;
      case 1:
        return Assets.images.avatar2;
      case 2:
        return Assets.images.avatar3;
      case 3:
        return Assets.images.avatar4;
      default:
        return Assets.images.avatar1;
    }
  }
}

Future<dynamic> _showRulesDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppTheme.backgroundColor,
        title: const Text('Reglas de participación'),
        content: const Text(
            '1. Solicita la palabra para intervenir.\n2. Mantén tu micrófono apagado hasta que se te conceda la palabra.\n3. No interrumpas a otros participantes.\n4. Mantén tu intervención en un tiempo razonable.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const AgoraText(
              text: 'Entendido',
              fontSize: 16,
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> _upsDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppTheme.backgroundColor,
        title: const Text('Ups!'),
        content: const Text('Esta funcionalidad aún no está disponible.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const AgoraText(
              text: 'Entendido',
              fontSize: 16,
            ),
          ),
        ],
      );
    },
  );
}
