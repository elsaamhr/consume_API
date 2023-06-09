import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserController {
  Future<List<User>> getUser() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");

    Response response = await http.get(url);
    List result = jsonDecode(response.body);


    List<User> dataUser = result.map((e) => User.fromJson(e)).toList();

    return dataUser;
  }
}