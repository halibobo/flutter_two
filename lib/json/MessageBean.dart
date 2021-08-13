class MessageBean{
  late final String msg;
  late final int timestamp;

  MessageBean(String msg, int timestamp){
    this.msg = msg;
    this.timestamp = timestamp;
  }

  String toString() {
    return 'Message{msg: $msg, timestamp: $timestamp}';
  }

}