
import 'package:flutter/material.dart';
import 'package:new_flutter_two/LayoutBox.dart';
import 'package:new_flutter_two/DetailPage.dart';

import 'ListContainerWidget.dart';

class NavigationBarPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new NavigationBarPageState();
  }
}

class NavigationBarPageState extends State<NavigationBarPage>{
  int _index = 0;
  List<Widget> _homeWidgets = [
    LayoutBox(),
    DetailPage(),
    ListContainerWidget(),
    LayoutBox(),
  ];

  void _onBottomNavigationBarTapped(index){
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: IndexedStack(
        index:_index,
        children: _homeWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onBottomNavigationBarTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          _getBottomNavigationBar("1","","",0),
          _getBottomNavigationBar("2","","",1),
          _getBottomNavigationBar("3","","",2),
          _getBottomNavigationBar("4","","",3)
        ],

      ),
    );
  }

  BottomNavigationBarItem _getBottomNavigationBar(
      String title, String normalIcon, String pressedIcon, int index
      ){
    return BottomNavigationBarItem(
        icon: _index == index
            ? Image.asset(
          pressedIcon,
          width: 32,
          height: 28,
        )
            : Image.asset(
          normalIcon,
          width: 32,
          height: 28,
        ),
        label: title,
    );
  }


}