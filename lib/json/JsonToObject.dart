
import 'dart:convert';

class JsonToObject{
  int x;
  int y;
  String description;
  JsonToObject(this.x, this.y, this.description);

  Map<String,dynamic> toJson() => {
    'x': x,
    'y': y,
    'desc': description
  };


  void test() {
    var jsonToObject = JsonToObject(1, 2, "description");
    var jsonToObjectJson = json.encode(jsonToObject);
    print('jsonToObjectJson = $jsonToObjectJson');

    dynamic obj = json.decode(jsonToObjectJson);
    print('obj = $obj');

    var jsonArray = [jsonToObject,jsonToObject];
    var jsonArrayStr = json.encode(jsonArray);
    print("jsonStr = $jsonArrayStr");



  }
}