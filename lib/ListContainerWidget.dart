


import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:new_flutter_two/ListViewItemWidget.dart';

class ListContainerWidget extends StatelessWidget {

  static List<Map<String, Object>> list(int page, int size) {
    return List<Map<String, Object>>.generate(size, (index) {
      return {
        'title': '标题${index + (page - 1) * size + 1}：这是一个列表标题，最多两行，多处部分将会被截取',
        'imageUrl':
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3331308357,177638268&fm=26&gp=0.jpg',
        'viewCount': 180,
      };
    });
  }

  var data = list(1, 180);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFEFEF),
      child: ListView.builder(
        itemCount: 180,
        itemBuilder: (context, index) {
          return ListViewItemWidget(data[index]["title"].toString(),
              data[index]["imageUrl"].toString(),180);

        },
      ),
    );
  }
}