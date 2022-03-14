library dots_indicator;

import 'dart:math';
import 'dart:ui';

import 'dots_decorator.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final double position;
  final DotsDecorator decorator;
  final Axis axis;
  final bool reversed;

  const DotsIndicator({
    Key? key,
    required this.dotsCount,
    this.position = 0.0,
    this.decorator = const DotsDecorator(),
    this.axis = Axis.horizontal,
    this.reversed = false,
  })  : assert(dotsCount != null && dotsCount > 0),
        assert(position != null && position >= 0),
        assert(decorator != null),
        assert(
        position < dotsCount,
        "Position must be inferior than dotsCount",
        ),
        super(key: key);

  Widget _buildDot(int index) {
    final state = min(1.0, (position - index).abs());

    final size = Size.lerp(decorator.activeSize, decorator.size, state);
    final color = Color.lerp(decorator.activeColor, decorator.color, state);
    final shape = ShapeBorder.lerp(
      decorator.activeShape,
      decorator.shape,
      state,
    );

    return Container(
      width: size!.width,
      height: size.height,
      margin: decorator.spacing,
      decoration: ShapeDecoration(
        color: color,
        shape: shape!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dotsList = List<Widget>.generate(dotsCount, _buildDot);
    final dots = reversed == true ? dotsList.reversed.toList() : dotsList;

    return axis == Axis.vertical
        ? Column(mainAxisSize: MainAxisSize.min, children: dots)
        : Row(mainAxisSize: MainAxisSize.min, children: dots);
  }
}
