import 'package:flutter/material.dart';

class MarqueeItem {
  final Offset offset;
  final Widget child;

  const MarqueeItem({
    required this.offset,
    required this.child,
  });
}