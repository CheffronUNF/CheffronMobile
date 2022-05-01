import 'package:cheffron_mobile/JWT.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  Future<dynamic> read(String key) async {
    var prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(key);

    return res != null ? jsonDecode(res) : null;
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  clear() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<String?> jwt() async {
    try {
      var jwt = await read("jwt");
      return jwt;
    }
    catch (e) {
      return null;
    }
  }

  Future<String?> userId() async {
    var jwt = await this.jwt();

    if (jwt == null)
    {
      return null;
    }

    var data = parseJwt(jwt);

    return data['sub'];
  }
}