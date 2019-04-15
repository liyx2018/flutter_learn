import 'package:rxdart/rxdart.dart';

void main(List<String> arguments) async{
  //创建Observable
  //1.把stream包装成Observable 输出结果12 25 58
  var obs = Observable(Stream.fromIterable([12, 25, 58]));
  obs.listen((data) => print(data));
  //2.通过Future创建 输出结果9999
  var obb = Observable.fromFuture(new Future.value(9999));
  obb.listen((data) => print(data));
  //3.通过fromIterable创建  输出结果111 222 333
  var obser = Observable.fromIterable([111, 222, 333]);
  obser.listen(print);

  //interval 间隔一段时间再输出流 输出 每隔两秒输出数据 12 25 58
  var interval = Observable(Stream.fromIterable([12, 25, 58]))
      .interval(new Duration(seconds: 2));
  interval.listen(print);

  //map方法能够让我们迭代的处理每一个数据并返回一个新的数据 输出200 300 400
  Observable(Stream.fromIterable([100, 200, 300]))
      .map((item) => (item + 100))
      .listen(print);

  //where 只关心Stream中的特定数据
  var ssub = new PublishSubject<int>();

  ssub.where((val) => val.isOdd)
      .listen( (val) => print('This only prints odd numbers: $val'));


  ssub.where((val) => val.isEven)
      .listen( (val) => print('This only prints even numbers: $val'));

  ssub.add(1);
  ssub.add(2);
  ssub.add(3);

  //expand方法能够让我们把把每个item扩展至多个流  输出li LI ya YA xi XI
  Observable(Stream.fromIterable(["li", "ya", "xi"]))
      .expand((item) => [item, item.toUpperCase()])
      .listen(print);

  //merge方法能合并多个流  输出结果：视觉 股票 中国 跌停
  Observable.merge([
    Stream.fromIterable(["视觉", "中国"]),
    Stream.fromIterable(["股票", "跌停"])
  ]).listen(print);

  //顺序执行多个流：concat 输出结果 55 555 5555 88 888 8888
  Observable.concat([
    Stream.fromIterable([55, 555, 5555]),
    Stream.fromIterable([88, 888, 8888])
  ]).listen(print);

  //every 检查每一个item 输出true
  Observable.fromIterable([1, 2, 3, 4, 5])
      .every((x) => x < 10)
      .asObservable()
      .listen(print);
  //debounce  数据拦截 结果是：谁
  var sub = new PublishSubject<String>();

  sub.debounce(new Duration(milliseconds: 500)).listen((s) => print(s));
  sub.add('你');
  sub.add('你是');
  await Future.delayed(Duration(milliseconds: 200));
  sub.add("你是谁");
  sub.add("哈哈哈");
// 这时还没有任何的output
  await Future.delayed(Duration(milliseconds: 700));


  //Observables 默认是单一订阅，多次订阅会报错，可以使用asBroadcastStream处理多订阅，
  // 在处理多订阅Observable的时候，onListen方法只有在第一次会被调用。且各个订阅者之间不会互相干涉
  var sss =
      Observable(Stream.fromIterable([1, 2, 3, 4, 5])).asBroadcastStream();
  //第一个订阅者
  sss.interval(Duration(seconds: 1)).map((item) => ++item).listen(print);
  //第二个订阅者
  sss.listen(print);

  //====================================================================================================
  //PublishSubjects    因为第二个监听是在中途加进来的，所以它并没有监听到数据Item1。

  var subbb = new PublishSubject<String>();
  subbb.listen((item) => print(item));
  subbb.add("Item1");
     // 添加第二个listener
  subbb.listen((item) => print(item.toUpperCase()));
  subbb.add("Item2");
  subbb.add("Item3");
      // 这句话只是为了防止在数据处理完毕之前，进程就被杀死了
  await Future.delayed(Duration(seconds: 5));
     // 取消所有的Subscriptions
  subbb.close;

  //缓存最新一次事件的广播流控制器：BehaviorSubject
  final subject = new BehaviorSubject<int>();

  subject.add(1);
  subject.add(2);
  subject.add(3);

  subject.stream.listen((da)=>print("广播流输出：$da")); // prints 3
  subject.stream.listen((da)=>print("广播流输出：$da")); // prints 3
  subject.stream.listen((da)=>print("广播流输出：$da"));

  //ReplaySubject  缓存更多事件的广播流控制器 maxsize控制缓存个数
  final replay = new ReplaySubject(maxSize: 2);

  replay.add(1);
  replay.add(2);
  replay.add(3);

  replay.stream.listen(print); // prints 1
  replay.stream.listen(print); // prints 1
  replay.stream.listen(print);

}

void publishSubDemo() async{

  var subject = new PublishSubject<String>();
  subject.listen((item) => print(item));
  subject.add("Item1");

// 添加第二个listener
  subject.listen((item) => print(item.toUpperCase()));

  subject.add("Item2");
  subject.add("Item3");

// 这句话只是为了防止在数据处理完毕之前，进程就被杀死了
  await Future.delayed(Duration(seconds: 5));

// 取消所有的Subscriptions
  subject.close;

}
