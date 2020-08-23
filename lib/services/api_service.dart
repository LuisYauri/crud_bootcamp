import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ApiService {
  String _urlBase = 'https://reqres.in/api/';

  Future<Map> getListUsers() async {
    try {
      var response = await http.get('${_urlBase}users?page=2');
      return convert.jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  Future<Map> createUser(data) async {
    try {
      var response = await http.post('${_urlBase}users', body: data);
      return convert.jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  Future<Map> updateUser(id, data) async {
    try {
      var response = await http.put('${_urlBase}users/$id}', body: data);
      return convert.jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }

  Future<Map> deleteUser(id) async {
    try {
      var response =
          await http.delete('https://jsonplaceholder.typicode.com/posts/1');
      return convert.jsonDecode(response.body);
    } catch (e) {
      return e;
    }
  }
}
