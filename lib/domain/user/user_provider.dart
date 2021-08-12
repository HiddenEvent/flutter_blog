import 'package:get/get.dart';

const host = "http://192.168.31.1:8080";

/*GetX 에서 가지고 있는 GetConnect를 상속받으면 손쉽게 통신 가능*/
class UserProvider extends GetConnect {
  // Future == Promise (데이터 약속)
  Future<Response> login(Map data) => post("$host/login", data);
}
