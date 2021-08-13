import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_flutter_two/json/MessageBean.dart';
import 'anim/AnimWidget.dart';
import 'anim/AnimationDemoView.dart';

void main(){
  print("hello world!");
  runApp(DetailPage());
}


class DetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(0,24,0,0),
      child: GestureDetector(
        child:new Column(
          children: [
            Container(
              height: 56,
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(5.0),
                  color: Colors.blue[500]),
              child: new Row(
                //列表项的类型是 <Widget>
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(Icons.menu),
                    tooltip: 'Navigation menu',
                    onPressed: null, // null 会禁用 button
                  ),
                  // Expanded expands its child to fill the available space.
                  new Expanded(
                      child: Center(
                        child : Text("title$counter"),
                      )
                  ),
                  new IconButton(
                    icon: new Icon(Icons.search),
                    tooltip: 'Search',
                    onPressed: null,
                  ),
                ],
              ),
            ),
            Center(
                child: Text("center",textDirection: TextDirection.ltr)
            ),
            Padding(padding: const EdgeInsets.fromLTRB(0,12,0,0),),
            Text("data1",textDirection: TextDirection.rtl),
            Padding(padding: const EdgeInsets.fromLTRB(0,12,0,0),),
            Stack(
              children: [
                Text("stack1",textDirection: TextDirection.rtl,),
                Text("stack2",textDirection: TextDirection.rtl,),
                Text("stack3",textDirection: TextDirection.rtl,),
                Text("stack4",textDirection: TextDirection.rtl,),
                AnimWidget(),
                AnimationDemoView()
              ],
            )
          ],
        ),
        onTap: () => _toast("data"),
    ));

  }

  _toast(String title){
    this.setState(() {
      counter ++ ;
    });
    Fluttertoast.showToast(
        msg: "data$counter" ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // 消息框弹出的位置
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    if(counter >= 10){
      final msg = new MessageBean("detail",DateTime.now().millisecondsSinceEpoch);
      Navigator.pop(context, msg);
    }
  }
}