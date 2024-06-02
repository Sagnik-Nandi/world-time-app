import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/choose_loc.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        //it is a map object which is a dart equivalent of dictionary .. 
        //it helps to navigate among different pages
        //context is a flutter object that keeps track of where in the widget tree we are situated
        '/': (context) => Loading(), //the root page or base page
        '/home': (context) => Home(), // home page
        '/location': (context) => ChooseLoc(), //location page
      },
    ));
