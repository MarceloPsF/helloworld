import 'package:flutter/material.dart';

void main() {
  runApp(const CronogramaApp());
}

class CronogramaApp extends StatelessWidget {
  const CronogramaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronograma de Atividades',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CronogramaPage(),
    );
  }
}

class CronogramaPage extends StatelessWidget {
  const CronogramaPage({super.key});

  final List<Map<String, String>> atividades = const [
    {
      'horario': '08:00 - 09:00',
      'descricao': 'Planejamento diário e revisão de tarefas',
    },
    {
      'horario': '09:00 - 11:00',
      'descricao': 'Desenvolvimento de código e implementação',
    },
    {
      'horario': '11:00 - 12:00',
      'descricao': 'Reunião de equipe e alinhamento de prioridades',
    },
    {
      'horario': '13:00 - 14:00',
      'descricao': 'Análise de requisitos e documentação',
    },
    {
      'horario': '14:00 - 16:00',
      'descricao': 'Testes, correções e revisão de código',
    },
    {
      'horario': '16:00 - 17:00',
      'descricao': 'Encerramento do dia e organização de próximas atividades',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cronograma de Atividades'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: atividades.length,
        itemBuilder: (context, index) {
          final atividade = atividades[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade700,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(atividade['descricao']!),
              subtitle: Text(atividade['horario']!),
            ),
          );
        },
      ),
    );
  }
}
