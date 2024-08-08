import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_prac/modal/User.dart';

class FetchUsers{
  static Future fetchData() async {
    try {
      const url = 'https://randomuser.me/api/?results=100';
      final uri = Uri.parse(url);
      final response =await http.get(uri);
      final body = response.body;
      final result = jsonDecode(body);
      final usersList = result['results'] as List<dynamic>;
      final users = usersList.map((e){
            return User.fromMap(e);
        }).toList();
      return users;
    } catch (err) {
      print(err);
    }
  }
}