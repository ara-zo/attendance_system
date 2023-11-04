import 'dart:convert';

import 'package:http/http.dart' as http;

class Retrofit {
  // base url
  var baseUrl = '';

  // headers
  // baseport
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/hal+json',
  };

  Future<dynamic> get(String path, dynamic data) async {
    print('get : $path, $data');
    http.Response response = await http.get(
      Uri.parse(baseUrl + path),
      headers: header,
    );

    if (response.statusCode == 200) {
      print('response body : ${response.body}');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<dynamic> post(String path, dynamic data) async {
    print('post : $path, $data');
    http.Response response = await http.post(
      Uri.parse(baseUrl + path),
      body: json.encode(data),
      headers: header,
    );

    if (response.statusCode == 200) {
      print('response body : ${response.body}');
      return json.decode(response.body);
    } else {
      print('${response.body}');
      throw Exception('Failed to post data: ${response.statusCode}');
    }
  }
}
