import '../models/conteudo.dart';
import 'dados_fake.dart';
import '../services/favoritos_service.dart';

List<Conteudo> favoritos = [];

Future<void> carregarFavoritos() async {
  final titulos = await FavoritosService.carregarFavoritos();

  favoritos.clear();

  for (var filme in catalogo) {
    if (titulos.contains(filme.titulo)) {
      favoritos.add(filme);
    }
  }
}
