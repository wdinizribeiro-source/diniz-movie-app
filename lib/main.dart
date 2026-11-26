import 'package:flutter/material.dart';

import 'data/favoritos.dart';
import 'widgets/menu_inferior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await carregarFavoritos();

  runApp(const DinizMovie());
}

class DinizMovie extends StatelessWidget {
  const DinizMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diniz Movie',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MenuInferior(),
    );
  }
}
