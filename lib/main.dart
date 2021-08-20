import 'package:flutter/material.dart';
import 'package:movieapp/screens/Actorinfo.dart';
import 'package:movieapp/screens/showdetailscreen.dart';

import './screens/dashboard_screen.dart';
import './screens/movie_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
      

  MaterialColor myColor = MaterialColor(0xFF171721,{
                  50:Color.fromRGBO(136,14,79, .1),
                  100:Color.fromRGBO(136,14,79, .2),
                  200:Color.fromRGBO(136,14,79, .3),
                  300:Color.fromRGBO(136,14,79, .4),
                  400:Color.fromRGBO(136,14,79, .5),
                  500:Color.fromRGBO(136,14,79, .6),
                  600:Color.fromRGBO(136,14,79, .7),
                  700:Color.fromRGBO(136,14,79, .8),
                  800:Color.fromRGBO(136,14,79, .9),
                  900:Color.fromRGBO(136,14,79, 1),
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: DashboardScreen(),
      routes: {
        MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
        ShowDetailsScreen.routeName: (ctx) => ShowDetailsScreen(),
      },
    );
  }
}
