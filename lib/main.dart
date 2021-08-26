import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';


void main() => runApp(MaterialApp(
  // Initial route, when the application is starting
  initialRoute: '/',
  // Every route you can choose, each route has its screen
  routes: {
    // Index screen
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));