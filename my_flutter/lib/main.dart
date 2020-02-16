import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_flutter/Home.dart';
import 'package:my_flutter/MyApp.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
    switch (route) {
        case '/':
            return new MyApp();
        case 'home':
            return new Home();
        default:
            return Center(
              child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
            );
    }
}


