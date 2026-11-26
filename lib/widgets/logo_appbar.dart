import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget {
  const LogoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      child: Image.asset('assets/imagens/logo.png', height: 50),
    );
  }
}
