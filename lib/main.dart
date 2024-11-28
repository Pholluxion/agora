import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:agora/core/core.dart';
import 'package:agora/widgets/widgets.dart';

void main() {
  runApp(const AgoraApp());
}

class AgoraApp extends StatefulWidget {
  const AgoraApp({super.key});

  @override
  State<AgoraApp> createState() => _AgoraAppState();
}

class _AgoraAppState extends State<AgoraApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agora',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Agora Widget Book')),
        body: const _WidgetBook(),
        bottomSheet: const AgoraBottomSheet(),
      ),
    );
  }
}

class _WidgetBook extends StatelessWidget {
  const _WidgetBook();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const AgoraImagotipo(),
            gap,
            const AgoraLogotipo(),
            titleText,
            gap,
            subtitleText,
            gap,
            pharagraphText,
            gap,
            const AgoraTimer(),
            gap,
            avatars,
            gap,
            elevatedButton,
            gap,
            outlinedButton,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
            gap,
          ],
        ),
      ),
    );
  }
}

final avatars = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    AgoraAvatar(image: Assets.images.avatar1),
    AgoraAvatar(image: Assets.images.avatar2),
    AgoraAvatar(image: Assets.images.avatar3),
    AgoraAvatar(image: Assets.images.avatar4),
  ],
);

final textFormField = TextFormField(
  decoration: InputDecoration(
    labelText: 'Nombre de usuario',
    labelStyle: textStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.kBorderRadiusAll),
    ),
  ),
);

const gap = Gap.gap32;

final textStyle = TextStyle(color: AppTheme.text);

final elevatedButton = ElevatedButton(
  onPressed: () {},
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AgoraText(
        text: 'Elevated Button',
        fontSize: 15.0,
      )
    ],
  ),
);

final outlinedButton = OutlinedButton(
  onPressed: () {},
  child: const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      AgoraText(
        text: 'Outlined Button',
        fontSize: 15.0,
      )
    ],
  ),
);

const titleText = AgoraText(
  text: 'Agora',
  fontSize: 100,
  fontFamily: FontFamily.zenTokyoZoo,
);
const subtitleText = AgoraText(
  text: 'Widget Book',
  fontSize: 20,
  textAlign: TextAlign.left,
  fontWeight: FontWeight.bold,
  fontFamily: FontFamily.montserrat,
);
const pharagraphText = AgoraText(
  text:
      'Anim laboris voluptate aliqua non nisi commodo mollit et excepteur veniam enim. Proident aute non ad esse nostrud eiusmod et duis nostrud commodo. Anim in est eiusmod amet nostrud et proident ea. Ut voluptate ad ad ea commodo occaecat fugiat non esse.',
  fontSize: 15,
  textAlign: TextAlign.left,
  fontFamily: FontFamily.montserrat,
);

class AgoraBottomSheet extends StatelessWidget {
  const AgoraBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                gap,
                textFormField,
                gap,
                elevatedButton,
                gap,
                outlinedButton,
                gap,
              ],
            ),
          ),
        );
      },
    );
  }
}
