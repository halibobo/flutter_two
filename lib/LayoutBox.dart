
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_flutter_two/DetailPage.dart';

import 'ApplicationPage.dart';

class LayoutBox extends StatelessWidget{

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(onPressed: null, icon: new Icon(Icons.menu)),
        title: new Text("scaffold"),
        actions: [
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: new Center(
        child: new Container(
          width: 300,
          height: 300,
          color: Colors.blue,
          child: Container(
            color: Colors.red,
            margin: EdgeInsets.fromLTRB(10, 0, 20, 30),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.white60,
              child: Text('这是一长段文字，这是一长段文字,这是一长段文字，这是一长段文字,这是一长段文字，这是一长段文字'),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
        )
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        heroTag: "hero",
        onPressed : () async => _toast("clicked"),
      ),
    );
  }

  _toast(String title){
    debugPrint('clicked');
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,  // 消息框弹出的位置
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    _pushDetail(context);
  }

  _pushDetail(BuildContext context) {
    final result = Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ApplicationPage( title: 'title',))
    );
    debugPrint('result = $result');

  }
}