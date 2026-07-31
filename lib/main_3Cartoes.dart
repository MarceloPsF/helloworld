import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                'Meu Cartão',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(flex: 1),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CardWidget(
                      bankName: 'Banco Nubank',
                      cardNumber: '5642 7786 9089 1216',
                      holderName: 'Cauê Oliveira',
                      expiryDate: '08/28',
                      cardColor: Colors.purple,
                    ),
                    const SizedBox(height: 20),
                    CardWidget(
                      bankName: 'Banco SESI/SENAI',
                      cardNumber: '1234 5678 9012 3456',
                      holderName: 'Marcelo Silva',
                      expiryDate: '10/30',
                      cardColor: Colors.blue,
                    ),
                    const SizedBox(height: 20),
                    CardWidget(
                      bankName: 'Banco Sicoob',
                      cardNumber: '5447 3920 1028 1765',
                      holderName: 'Vitor Sabino',
                      expiryDate: '12/29',
                      cardColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bankName;
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final Color cardColor;

  const CardWidget({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.holderName,
    required this.expiryDate,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bankName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 50,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.credit_card, color: Colors.orange),
              ),
            ],
          ),
          Text(
            cardNumber,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Titular',
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                  Text(
                    holderName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                expiryDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
