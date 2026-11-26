import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../data/dados_fake.dart';
import '../utils/app_colors.dart';
import '../widgets/card_filme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bannerAtual = 0;

  @override
  Widget build(BuildContext context) {
    final lancamentos = catalogo.take(3).toList();

    final populares = catalogo;

    final recomendados = catalogo.reversed.take(3).toList();

    return Scaffold(
      backgroundColor: AppColors.fundo,
      appBar: AppBar(
        backgroundColor: AppColors.fundo,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {},
          child: Image.asset('assets/imagens/logo.png', height: 90),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 220,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  bannerAtual = index;
                });
              },
            ),
            items: catalogo.map((filme) {
              return Builder(
                builder: (context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(filme.imagem, fit: BoxFit.cover),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          bottom: 16,
                          child: Text(
                            filme.titulo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: catalogo.asMap().entries.map((entry) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: bannerAtual == entry.key ? 12 : 8,
                height: bannerAtual == entry.key ? 12 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: bannerAtual == entry.key
                      ? Colors.red
                      : Colors.grey.shade700,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          const Text(
            '🎬 Lançamentos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...lancamentos.map((filme) => CardFilme(filme: filme)),

          const SizedBox(height: 24),

          const Text(
            '🔥 Filmes Populares',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...populares.map((filme) => CardFilme(filme: filme)),

          const SizedBox(height: 24),

          const Text(
            '⭐ Recomendados para Você',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...recomendados.map((filme) => CardFilme(filme: filme)),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
