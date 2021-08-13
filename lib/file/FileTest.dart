import 'dart:io';

void foo() async {
 const filePath = "";
 var file = File(filePath);
 try{
   bool exist = await file.exists();
   if(!exist) {
     await file.create();
   }
 }catch(e) {
   print(e);
 }
}

void writeFile() async{
  const filePath = "";
  var file = File(filePath);
  await file.writeAsString("contents");
  List<int> toBeWritten = [1,2,3];
  await file.writeAsBytes(toBeWritten);

}

void writeIOSink() async{
  const filepath = "path to your file";
  var file = File(filepath);
  IOSink? ioSink;
  try{
    ioSink = file.openWrite();
    ioSink.write('hello sank');
    await ioSink.flush();
  }catch(e){
    print(e);
  }finally{
    ioSink?.close();
  }
}