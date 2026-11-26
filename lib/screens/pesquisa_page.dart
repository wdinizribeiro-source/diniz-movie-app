import 'package:flutter/material.dart';
import '../widgets/menu_inferior.dart';
import '../data/dados_fake.dart';
import '../models/conteudo.dart';

class PesquisaPage extends StatefulWidget {
  const PesquisaPage({super.key});

  @override
  State<PesquisaPage> createState() => _PesquisaPageState();
}

class _PesquisaPageState extends State<PesquisaPage> {
  List<Conteudo> resultados = catalogo;

  String pesquisaAtual = '';
  String categoriaSelecionada = 'Todas';

  void filtrar() {
    setState(() {
      resultados = catalogo.where((filme) {
        final correspondePesquisa = filme.titulo.toLowerCase().contains(
          pesquisaAtual.toLowerCase(),
        );

        final correspondeCategoria =
            categoriaSelecionada == 'Todas' ||
            filme.categoria == categoriaSelecionada;

        return correspondePesquisa && correspondeCategoria;
      }).toList();
    });
  }

  Widget categoriaChip(String categoria) {
    final selecionada = categoriaSelecionada == categoria;

    return FilterChip(
      label: Text(
        categoria,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      selected: selecionada,
      onSelected: (value) {
        categoriaSelecionada = categoria;
        filtrar();
      },
      selectedColor: Colors.red,
      backgroundColor: const Color(0xFF1E1E1E),
      side: BorderSide(
        color: selecionada ? Colors.red : Colors.grey.shade700,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      labelStyle: const TextStyle(color: Colors.white),
      checkmarkColor: Colors.white,
      elevation: selecionada ? 4 : 0,
      pressElevation: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
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

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),

              onChanged: (texto) {
                pesquisaAtual = texto;
                filtrar();
              },

              decoration: InputDecoration(
                hintText: 'Digite um filme...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey.shade900,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                categoriaChip('Todas'),
                categoriaChip('Ação'),
                categoriaChip('Ficção'),
                categoriaChip('Animação'),
                categoriaChip('Drama'),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: resultados.length,

                itemBuilder: (context, index) {
                  final filme = resultados[index];

                  return Card(
                    color: Colors.grey.shade900,

                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(6),

                        child: Image.asset(
                          filme.imagem,
                          width: 50,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),

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
            ),
          ],
        ),
      ),
    );
  }
}
