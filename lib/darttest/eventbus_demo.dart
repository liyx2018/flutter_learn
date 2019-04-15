import 'dart:async';

import 'package:event_bus/event_bus.dart';

void main(){

  EventBus eventBus = EventBus();
  StreamSubscription loginsub=  eventBus.on<UserLoggedInEvent>().listen((event){
    print(event.user.name);
  }
  );
  //取消订阅
  //  loginsub.cancel();

  eventBus.fire(UserLoggedInEvent(User("liyaxi", 12)));
  
}

class UserLoggedInEvent {
  User user;

  UserLoggedInEvent(this.user);
}

class User{
  var name;
  var age;

  User(this.name, this.age);
}