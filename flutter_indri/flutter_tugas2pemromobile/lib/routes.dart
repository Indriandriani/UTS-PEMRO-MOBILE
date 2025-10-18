import 'package:flutter/material.dart';
import 'pages/scroll_example.dart';
import 'pages/grid_layout.dart';
import 'pages/dynamic_image.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/scroll': (context) => const ScrollExample(),
  '/grid': (context) => const GridLayoutExample(),
  '/images': (context) => DynamicImageExample(),
};
