import 'dart:convert';

/* Response 깨질 경우 사용*/
dynamic convertUtf8ToObject(dynamic body) {
  String respBody = jsonEncode(body); // json 데이터로 변경
  dynamic convertBody = jsonDecode(utf8.decode(respBody.codeUnits));
  return convertBody;
}