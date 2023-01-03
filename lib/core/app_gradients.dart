import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppGradients {
  static final linear = LinearGradient(colors: const [
    Color(0xFF57B6E5),
    Color.fromRGBO(130, 87, 229, 0.695),
  ], stops: const [
    0.0,
    0.695
  ], transform: const GradientRotation(2.13959913 * pi));
}
