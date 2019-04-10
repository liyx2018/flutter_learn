//dart中没有Interface，采用mixin的好处在于不用像实现Interface一样实现同样的功能
//使用factory关键字结合_权限符避免外部实例化和扩展
abstract class CanFixComputer {
  factory CanFixComputer._() {
    return null;
  }

  void fixComputer() {
    print('修电脑');
  }
}

abstract class CanDesignSoftware {
  factory CanDesignSoftware._() {
    return null;
  }

  void designSoftware() {
    print('设计软件');
  }
}

class Engineer {
  void doWork() {
    print('工程师在工作');
  }
}

class Teacher{
  void doWork() {
    print("老师工作中");
  }

}

//软件工程师
class SoftwareEngineer extends Engineer with CanFixComputer, CanDesignSoftware {
//  void fixComputer() {
//    print('修电脑');
//  }
//
//  void designSoftware() {
//    print('设计软件');
//  }
}

//IT教师
class ITTeacher extends Teacher with CanFixComputer {
//  void fixComputer() {
//    print('修电脑');
//  }
}


//------------------------------------------------------------------------------------
//mix的顺序  混入的多个类中有同样的方法时，最后mixin的优先级是最高的；如果mixin的同时还有implements，那么具体实现是在mixin中的
class First{
  void doPrint(){
    print("-----first-----");
  }
}

class Second{
  void doPrint(){
    print("-----Second-----");
  }
}

class Father{
  void doPrint(){
    print("-----Father-----");
  }
}


class Son1 extends Father with First,Second{
}

class Son2 extends Father with First implements Second{}

//------------------------------------------------------------------------------------

void main(){
   var itTeacher= new ITTeacher();
   itTeacher.doWork();
   itTeacher.fixComputer();
   print('----------------------------------');
   var softengineer= new SoftwareEngineer();
   softengineer.doWork();
   softengineer.fixComputer();
   softengineer.designSoftware();

   var son1=new Son1();
   son1.doPrint();
   var son2=new Son2();
   son2.doPrint();


}