import 'package:catho_app/ui/pages/catsPages.dart';
import 'package:catho_app/ui/pages/detailsPage4.dart';
import 'package:catho_app/ui/pages/myHomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (BuildContext context) => MyHomePage(),
        DetailsPage.routeName: (BuildContext context) => DetailsPage()
      },
      home: CatsPage(),
    );
  }
}