import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:discus_mobile/config/api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UserSource {
  static Future<Map> register(String username, String password) async {
    String url = '${Api.user}/register.php';
    try {
      Response response = await http.post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });

      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User Source - Register', e.toString());
      return {'success': false};
    }
  }

  static Future<Map> login(String username, String password) async {
    String url = '${Api.user}/login.php';
    try {
      Response response = await http.post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });

      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User Source - Login', e.toString());
      return {'success': false};
    }
  }

  static Future<bool> updateImage(
    String id,
    String oldImage,
    String newImage,
    String newBase64Code,
  ) async {
    String url = '${Api.user}/update_image.php';
    try {
      Response response = await http.post(Uri.parse(url), body: {
        'id': id,
        'old_image': oldImage,
        'new_image': newImage,
        'new_base64code': newBase64Code
      });

      Map responseBody = jsonDecode(response.body);
      return responseBody['success'];
    } catch (e) {
      DMethod.printTitle('User Source - Update Image', e.toString());
      return false;
    }
  }
}
