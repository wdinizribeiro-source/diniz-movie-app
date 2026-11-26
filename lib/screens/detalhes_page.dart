import '../services/favoritos_service.dart';

import 'package:flutter/material.dart';

import '../data/favoritos.dart';
import '../models/conteudo.dart';
import '../utils/app_colors.dart';

class DetalhesPage extends StatefulWidget {
  final Conteudo filme;

  const DetalhesPage({super.key, required this.filme});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  late bool favorito;

  @override
  void initState() {
    super.initState();
    favorito = favoritos.contains(widget.filme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundo,

      appBar: AppBar(
        backgroundColor: AppColors.fundo,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: GestureDetector(
          onTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Image.asset('assets/imagens/logo.png', height: 60),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                favorito = !favorito;

                if (favorito) {
                  favoritos.add(widget.filme);
                } else {
                  favoritos.remove(widget.filme);
                }

                FavoritosService.salvarFavoritos(
                  favoritos.map((f) => f.titulo).toList(),
                );
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    favorito
                        ? 'Filme adicionado aos favoritos'
                        : 'Filme removido dos favoritos',
                  ),
                ),
              );
            },
            icon: Icon(
              favorito ? Icons.favorite : Icons.favorite_border,
              color: favorito ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.filme.imagem,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.filme.titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.filme.categoria,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    'Ano: ${widget.filme.ano}',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Classificação: ${widget.filme.classificacao}',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Assistir'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Sinopse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    widget.filme.descricao,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
