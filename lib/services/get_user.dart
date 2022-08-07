import 'package:crud_api_operation/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

getUser() async {
  Uri url = Uri.parse("https://maaz-api.tga-edu.com/api/users");
  var response = await http.get(url);
  var data = convert.jsonDecode(response.body);

  return UserModel.fromJson(data);
}
