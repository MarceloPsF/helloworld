import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Distância até Casa',
      home: const LocalizacaoPage(),
    );
  }
}

class LocalizacaoPage extends StatefulWidget {
  const LocalizacaoPage({super.key});

  @override
  State<LocalizacaoPage> createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState extends State<LocalizacaoPage> {
  // Localização fixa de destino (casa)
  static const double casaLatitude = -21.458310;
  static const double casaLongitude = -47.023244;

  double? distanciaMetros;
  bool carregando = false;
  String? mensagemErro;

  Future<void> buscarLocalizacao() async {
    setState(() {
      carregando = true;
      mensagemErro = null;
    });

    // O try/catch/finally garante que "carregando" sempre volte a false,
    // mesmo se algo der errado — isso evita o loading infinito.
    try {
      bool servicoAtivo = await Geolocator.isLocationServiceEnabled();

      if (!servicoAtivo) {
        setState(() {
          mensagemErro =
              'Ative o serviço de localização (GPS) e tente novamente.';
        });
        return;
      }

      LocationPermission permissao = await Geolocator.checkPermission();

      if (permissao == LocationPermission.denied) {
        permissao = await Geolocator.requestPermission();
      }

      if (permissao == LocationPermission.denied ||
          permissao == LocationPermission.deniedForever) {
        setState(() {
          mensagemErro = 'Permissão de localização negada.';
        });
        return;
      }

      // Timeout evita que o app fique preso para sempre esperando o GPS.
      Position posicao = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      final double distancia = Geolocator.distanceBetween(
        posicao.latitude,
        posicao.longitude,
        casaLatitude,
        casaLongitude,
      );

      setState(() {
        distanciaMetros = distancia;
      });

      print('Distância até casa: ${distancia.toStringAsFixed(1)} m');
    } catch (e) {
      setState(() {
        mensagemErro = 'Erro ao obter localização: $e';
      });
      print('Erro ao obter localização: $e');
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  String get distanciaFormatada {
    if (distanciaMetros == null) return '-- km';
    final km = distanciaMetros! / 1000;
    return '${km.toStringAsFixed(2)} km';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Distância até Casa')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.home, size: 80, color: Colors.green),

              const SizedBox(height: 20),

              const Text(
                'Distância entre a sua localização e sua casa:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Text(
                distanciaFormatada,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              if (mensagemErro != null) ...[
                const SizedBox(height: 20),
                Text(
                  mensagemErro!,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: carregando ? null : buscarLocalizacao,
                child: carregando
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Calcular Distância'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
