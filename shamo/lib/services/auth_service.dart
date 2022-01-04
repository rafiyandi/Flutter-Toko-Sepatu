import 'dart:convert';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "http://10.115.52.129:8000/api";

  Future<UserModel> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'aplication/json'};
    var body = jsonEncode({
      'name': name,
      'username': name,
      'email': email,
      'password': password,
    });

    //digunakan untuk melakukan request kedalam backend kita dan method yang digunakan disesuaikan dengan yang ada di backend
    var response = await http.post(url, headers: headers, body: body);

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  //encode mengubah variabel phpb berisi array ke json misalkan, dan decode kebalikanya

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'aplication/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer' + data['access_token'];
      print('Login berhasil');

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
