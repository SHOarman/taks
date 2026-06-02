import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _favKey = 'favorite_products';

  static Future<void> saveFavorites(List<String> favIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favKey, favIds);
  }

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favKey) ?? [];
  }
}
