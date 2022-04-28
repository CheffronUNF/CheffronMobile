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
}