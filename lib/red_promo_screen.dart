import 'package:flutter/material.dart';
import 'package:link_redirect/utils/utils.dart';

class RedPromoScreen extends StatelessWidget {
  const RedPromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.redAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Text(
          "!!! Red Promo !!!\nCode: ${UniLinksService.promoId}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}