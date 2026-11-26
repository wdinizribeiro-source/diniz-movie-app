import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import '../screens/pesquisa_page.dart';
import '../screens/minha_lista_page.dart';

class MenuInferior extends StatefulWidget {
  const MenuInferior({super.key});

  @override
  State<MenuInferior> createState() => _MenuInferiorState();
}

class _MenuInferiorState extends State<MenuInferior> {
  int paginaAtual = 0;

  final List<Widget> paginas = [
    const HomePage(),
    const PesquisaPage(),
    const MinhaListaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[paginaAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            paginaAtual = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Minha Lista',
          ),
        ],
      ),
    );
  }
}
