import 'package:flutter/material.dart';
import 'package:evaccine/adicionarvacinaanimal.dart';

class VaccinesAnimalPage extends StatelessWidget {
  final List<String> vaccineStatus = [
    'Atraso', 'Administrada', 'Futura', 'Atraso', 'Administrada'
  ]; // Exemplo de lista de status de vacinas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacinas'),
      ),
      body: ListView.builder(
        itemCount: vaccineStatus.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Vacina ${index + 1}'),
              subtitle: Text(vaccineStatus[index]), // Status da vacina
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddVaccineAnimalPage()));
        },
        label: Text('Adicionar Vacina'),
        icon: Icon(Icons.add),
      ),
    );
  }
}