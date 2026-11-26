import 'package:flutter/material.dart';

import '../models/conteudo.dart';
import '../screens/detalhes_page.dart';
import '../utils/app_colors.dart';

class CardFilme extends StatelessWidget {
  final Conteudo filme;

  const CardFilme({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetalhesPage(filme: filme)),
          );
        },

        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            filme.imagem,
            width: 60,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),

        title: Text(
          filme.titulo,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          filme.categoria,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
