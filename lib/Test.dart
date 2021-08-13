import 'dart:io';

class Test {
  void test(){
    var name = 'Voyager I';
    var year = 1977;
    var antennaDiameter = 3.7;
    var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
    var image = {
      'tags': ['saturn'],
      'url': '//path/to/saturn.jpg'
    };

    int i = 1;
    double d = 0.3;
    String s = "abcdefg";
    dynamic c = "word";
    bool b = false;
    const num = "adaddad";
    final int f = 123;
    List<dynamic> arr = ["1",2,"adad"];
    List<int> arr2 = [1,12,2,3];
    var map = new Map();
    map["name"] = "carr";
    map["age"] = 31;

    Map m = new Map();
    m["name"] = "bwm";

    var clapping = '\u{1f44f}';
    print(clapping);
    print(#s == new Symbol("s")); // true
  }

  /// 带参数名称a,b
  int add ( {int a=0,int b= 1}){
    return a + b;
  }

  /// 默认值b = 1
  int add4(int a,[int b= 1]){
    return a+ b;
  }

  add2(int a,int b){
    return a + b;
  }

  add3(a,b) => a + b;

  sayHello({required String name}){
    print("hello, my name is $name");
  }

  sayHello2({name: String}) {
    print("hello, my name is $name");
  }

  // typedef Adder = int Function(int, int);
  Function makeAdder(int extra) {
    int adder(int x, int y) {
      return x + y + extra;
    }
    return adder;
  }

  testException() async {
    try{
      add3(1, 3);
    }catch(e){
      print("FormatException");
    }

    try{
      var file = new File("path");
      var exists = await file.exists();
      print('file ${exists ? 'exists' : 'not exists'}');
    }catch(e){
      print(e);
    }

  }

  main(){
    test();
    add(a: 1,b: 3);
    add4(1,3);
    add2(11, 21);
    add3(23, "wqwe");

    sayHello(name: "su");
    sayHello2(name :"yu");

    var adder = makeAdder(1);
    print(adder(2,3));
  }
}