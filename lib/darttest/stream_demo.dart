import 'dart:async';

/***
 * 异步事件流 Stream
 */
void main(){
  Stream.fromIterable([2,3,6]);

  StreamController controller = new StreamController();
  //监听这个流的出口，当有data流出时，打印这个data
  StreamSubscription subscription = controller.stream.listen((data)=> print(data));
  controller.sink.add("hello");

  StreamController<int> streamController = new StreamController();
  final streamTransformer=  StreamTransformer<int,String>.fromHandlers(
      handleData:(value,sink){
       if(value==18){
         sink.add("猜对了");
       }else{
         sink.addError("没那么幸运，继续加油！");
       }
      }
  );
  streamController.stream.transform(streamTransformer).listen((data)=> print(data),onError:(error)=> print(error));
  streamController.sink.add(18);

  //流有两种："Single-subscription" streams 单订阅流    "broadcast" streams 多订阅流
  //单订阅流不能有多个收听者(listen) ，如果多个收听者想要收听单个订阅流，请使用asBroadcastStream在非广播流之上创建广播流
  StreamController streamController1= new StreamController();
  Stream stream = streamController1.stream.asBroadcastStream();
  stream.listen((data)=>print(data));
  stream.listen((data)=>print(data));
  streamController1.sink.add("你好，liyaxi");


}