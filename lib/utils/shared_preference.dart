import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

@lazySingleton
class SharedPreference {
  final String _favoritesKey = "FAVORITES_KEY";

  Future<void> _savePreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> _getPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPreference = prefs.getString(key);
    if (savedPreference == null) {
      return "";
    }
    return savedPreference;
  }

  // Future<bool> _getBoolean(String key) async {
  //   final value = await _getPreference(key);
  //   if (value == "") {
  //     return false;
  //   } else {
  //     return bool.parse(value);
  //   }
  // }

  Future<List<String>> favorites() async {
    final pref = await _getPreference(_favoritesKey);
    if(pref == "") {
      return [];
    }
    final List<String> list = List<String>.from(json.decode(pref) as List);
    return list;
  }

  Future<void> setFavorites(List<String> favorites) {
    return _savePreference(_favoritesKey, json.encode(favorites));
  }
}
