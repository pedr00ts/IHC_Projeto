import 'package:evaccine/perfilanimalregistado.dart';
import 'package:flutter/material.dart';
import 'package:evaccine/adicionarvacinaanimal.dart';

import 'adicionarperfilfamiliapage.dart';
import 'adicionarperfilfanimalpage.dart';
import 'main.dart';
import 'mudarPerfil.dart';

class VaccinesAnimalAdicionadaPage extends StatefulWidget {
  @override
  _VaccinesAnimalAdicionadaPageState createState() =>
      _VaccinesAnimalAdicionadaPageState();
}

enum VaccineStatus {
  todas,
  administrada,
  futura,
  atraso,
}

class _VaccinesAnimalAdicionadaPageState
    extends State<VaccinesAnimalAdicionadaPage> {
  VaccineStatus selectedStatus = VaccineStatus.todas;
  List<String> vaccineStatus = [
    'Administrada'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacinas'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Família',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Maria Luisa Oliveira',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MudarPerfilPage(
                      email: 'marialuisa@gmail.com',
                      name: 'Maria Luisa Oliveira',
                      birthDate: '12/03/1987',
                      idNumber: '123456789',
                      phoneNumber: '9123456789',
                      address: 'Lisboa',
                      profiles: [],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Joao Oliveira',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MudarPerfilPage(
                      email: '',
                      name: 'Joao Oliveira',
                      birthDate: '24/12/2022',
                      idNumber: '234234234',
                      phoneNumber: '912345678',
                      address: 'Lisboa',
                      profiles: [],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewFamilyProfilePage(),
                    ),
                  );
                },
                child: Text('Adicionar Perfil'),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Animais de Estimação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Bobby',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilAnimalRegistado(
                      petName: 'Bobby',
                      chipNumber: '56781239',
                      birthDay: '16/05/2022',
                      petAddress: 'Lisboa',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewAnimalProfilePage(),
                    ),
                  );
                },
                child: Text('Adicionar Perfil'),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Definição',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Ajuda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Enviar feedback',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Terminar Sessão',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EvaccinePage(
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
                  items: [
                    DropdownMenuItem<VaccineStatus>(
                      value: VaccineStatus.todas,
                      child: Text('Todas'),
                    ),
                    DropdownMenuItem<VaccineStatus>(
                      value: VaccineStatus.administrada,
                      child: Text('Administradas'),
                    ),
                    DropdownMenuItem<VaccineStatus>(
                      value: VaccineStatus.futura,
                      child: Text('Futuras'),
                    ),
                    DropdownMenuItem<VaccineStatus>(
                      value: VaccineStatus.atraso,
                      child: Text('Atraso'),
                    ),
                  ],
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
                      subtitle: Text(vaccineStatus[index]),
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
                  builder: (context) => AddVaccineAnimalPage()));
        },
        label: Text('Adicionar Vacina'),
        icon: Icon(Icons.add),
      ),
    );
  }
}





