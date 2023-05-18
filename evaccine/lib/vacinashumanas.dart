import 'package:flutter/material.dart';
import 'package:evaccine/adicionarvacinapessoa.dart';

class Vacina {
  final String nome;
  final String status;

  Vacina({required this.nome, required this.status});
}

class VaccinesPage extends StatelessWidget {
  final List<Vacina> planoNacional = [
    Vacina(nome: 'Vacina 1', status: 'Administrada'),
    Vacina(nome: 'Vacina 2', status: 'Futura'),
    Vacina(nome: 'Vacina 3', status: 'Atraso'),
  ]; // Lista de vacinas do Plano Nacional de Saúde

  final List<Vacina> outrasVacinas = [
    Vacina(nome: 'Vacina 4', status: 'Administrada'),
    Vacina(nome: 'Vacina 5', status: 'Futura'),
    Vacina(nome: 'Vacina 6', status: 'Atraso'),
  ]; // Lista de outras vacinas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacinas'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Vacinas do Plano Nacional de Saúde',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: planoNacional.length,
              itemBuilder: (context, index) {
                Vacina vacina = planoNacional[index];
                return Card(
                  child: ListTile(
                    title: Text(vacina.nome),
                    subtitle: Text(vacina.status),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Outras Vacinas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: outrasVacinas.length,
              itemBuilder: (context, index) {
                Vacina vacina = outrasVacinas[index];
                return Card(
                  child: ListTile(
                    title: Text(vacina.nome),
                    subtitle: Text(vacina.status),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddVaccinePage()),
          );
        },
        label: Text('Adicionar Vacina'),
        icon: Icon(Icons.add),
      ),
    );
  }
}



