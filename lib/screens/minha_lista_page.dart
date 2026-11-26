import 'package:flutter/material.dart';
import '../widgets/menu_inferior.dart';
import '../data/favoritos.dart';

class MinhaListaPage extends StatelessWidget {
  const MinhaListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Favoritos: ${favoritos.length}');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MenuInferior()),
              (route) => false,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/imagens/logo.png', height: 90),
          ),
        ),
      ),
      body: favoritos.isEmpty
          ? const Center(
              child: Text(
                'Nenhum filme salvo',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final filme = favoritos[index];

                return Card(
                  color: Colors.grey.shade900,
                  child: ListTile(
                    title: Text(
                      filme.titulo,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      filme.categoria,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
