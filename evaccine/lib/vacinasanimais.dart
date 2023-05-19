import 'package:flutter/material.dart';
import 'package:evaccine/adicionarvacinaanimal.dart';

enum VaccineStatus {
  todas,
  administrada,
  futura,
  atraso,
}

class VaccinesAnimalPage extends StatefulWidget {
  @override
  _VaccinesAnimalPageState createState() => _VaccinesAnimalPageState();
}

class _VaccinesAnimalPageState extends State<VaccinesAnimalPage> {
  VaccineStatus selectedStatus = VaccineStatus.todas;
  final List<String> vaccineStatus = [
    'Atraso',
    'Administrada',
    'Futura',
    'Atraso',
    'Administrada'
  ]; // Exemplo de lista de status de vacinas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacinas'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filtrar por:',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<VaccineStatus>(
                  value: selectedStatus,
                  onChanged: (VaccineStatus? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedStatus = newValue;
                      });
                    }
                  },
                  items: VaccineStatus.values.map((VaccineStatus status) {
                    return DropdownMenuItem<VaccineStatus>(
                      value: status,
                      child: Text(status.toString().split('.').last),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vaccineStatus.length,
              itemBuilder: (context, index) {
                if (selectedStatus == VaccineStatus.todas ||
                    (selectedStatus == VaccineStatus.administrada &&
                        vaccineStatus[index] == 'Administrada') ||
                    (selectedStatus == VaccineStatus.atraso &&
                        vaccineStatus[index] == 'Atraso') ||
                    (selectedStatus == VaccineStatus.futura &&
                        vaccineStatus[index] == 'Futura')) {
                  return Card(
                    child: ListTile(
                      title: Text('Vacina ${index + 1}'),
                      subtitle: Text(vaccineStatus[index]), // Status da vacina
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddVaccineAnimalPage(),
            ),
          );
        },
        label: Text('Adicionar Vacina'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
