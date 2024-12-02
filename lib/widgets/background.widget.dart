import 'package:agora/core/core.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, this.factor = 0.8});

  final double factor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Assets.images.agora.image(
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).height * 0.8,
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.backgroundColor.withOpacity(0.1),
                AppTheme.backgroundColor.withOpacity(0.3),
                AppTheme.backgroundColor.withOpacity(0.5),
                AppTheme.backgroundColor.withOpacity(0.7),
                AppTheme.backgroundColor.withOpacity(0.9),
                AppTheme.backgroundColor,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
