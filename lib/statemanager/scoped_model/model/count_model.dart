import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model{
  int _count = 0;
  get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }

  //获取model的第一种方式是使用ScopedModelDescendant获取model
  //获取model的第二种方式，在Model中重写of方法
  CountModel of(context) =>
      ScopedModel.of<CountModel>(context);
}