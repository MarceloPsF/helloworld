import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Run | Debug | Profile
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Carteira Digital",
      home: CarteiraDigital(),
    );
  }
}

class CarteiraDigital extends StatelessWidget {
  const CarteiraDigital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carteira Digital"), centerTitle: true),

      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          CartaoBanco(
            corCartao: Colors.purple,
            banco: "Nubank",
            numero: "1111 2222 3333 4444",
            nome: "Marcelo",
            validade: "10/29",
            bandeira:
                "https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-0.png",
          ),

          SizedBox(height: 20),

          CartaoBanco(
            corCartao: Colors.orange,
            banco: "Itaú",
            numero: "5555 6666 7777 8888",
            nome: "Marcelo",
            validade: "03/31",
            bandeira:
                "https://logodownload.org/wp-content/uploads/2017/05/itau-logo-3.png",
          ),

          SizedBox(height: 20),

          CartaoBanco(
            corCartao: Colors.red,
            banco: "Santander",
            numero: "9999 0000 1111 2222",
            nome: "Marcelo",
            validade: "07/30",
            bandeira:
                "https://logodownload.org/wp-content/uploads/2017/05/santander-logo-1.png",
          ),

          SizedBox(height: 20),

          CartaoBanco(
            corCartao: Colors.blueGrey,
            banco: "Inter",
            numero: "3333 4444 5555 6666",
            nome: "Marcelo",
            validade: "12/28",
            bandeira:
                "https://logodownload.org/wp-content/uploads/2018/05/banco-inter-logo.png",
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CartaoBanco extends StatelessWidget {
  final Color corCartao;
  final String banco;
  final String numero;
  final String nome;
  final String validade;
  final String bandeira;

  const CartaoBanco({
    super.key,
    required this.corCartao,
    required this.banco,
    required this.numero,
    required this.nome,
    required this.validade,
    required this.bandeira,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: corCartao,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                banco,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sim_card, color: Colors.amber, size: 40),
              Image.network(bandeira, height: 40),
            ],
          ),

          Text(
            numero,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 2,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Titular",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    nome,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Validade",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    validade,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
