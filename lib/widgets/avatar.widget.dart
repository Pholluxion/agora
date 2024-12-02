import 'package:flutter/material.dart';

import 'package:agora/core/core.dart';

class AgoraAvatar extends StatelessWidget {
  const AgoraAvatar({
    super.key,
    required this.image,
    this.radius,
    this.color,
  });

  final double? radius;
  final Color? color;
  final AssetGenImage image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color ?? AppTheme.backgroundColor,
        child: image.image(),
      ),
    );
  }
}
