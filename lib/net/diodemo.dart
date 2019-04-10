import 'package:dio/dio.dart';

void main(){
  getHttp();
}

void getHttp() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    print(response);
  } catch (e) {
    print(e);
  }
}