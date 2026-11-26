import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoritosService {
  static const String chaveFavoritos = 'favoritos';

  static Future<void> salvarFavoritos(List<String> titulos) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(chaveFavoritos, jsonEncode(titulos));
  }

  static Future<List<String>> carregarFavoritos() async {
    final prefs = await SharedPreferences.getInstance();

    final dados = prefs.getString(chaveFavoritos);

    if (dados == null) {
      return [];
    }

    final List<dynamic> lista = jsonDecode(dados);


    return lista.cast<String>();
  }
}
