

import 'package:flutter/material.dart';
import 'package:new_flutter_two/DetailPage.dart';

class ApplicationPage extends StatefulWidget{
  final String title;

  ApplicationPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ApplicationPageState();
  }

}

class _ApplicationPageState extends State<ApplicationPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
    body: Center(
      child: DetailPage(),
    ),
    );
  }

}