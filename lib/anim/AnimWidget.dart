
import 'package:flutter/material.dart';

class AnimWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AnimWidgetState();
  }

}

class _AnimWidgetState extends State<AnimWidget> with SingleTickerProviderStateMixin{
  var controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: Duration(milliseconds: 5000),
        vsync: this);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      child: FlutterLogo(size: 200.0),
      scale: controller,
    );
  }

}