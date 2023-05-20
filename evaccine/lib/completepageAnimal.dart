import 'package:evaccine/main.dart';
import 'package:evaccine/profilepage.dart';
import 'package:evaccine/vacinasanimais.dart';
import 'package:evaccine/vacinasanimalaposinscrever.dart';
import 'package:evaccine/vacinashumanas.dart';
import 'package:flutter/material.dart';

import 'adicionarperfilfamiliapage.dart';
import 'adicionarperfilfanimalpage.dart';
import 'completepageHumano.dart';
import 'widget/profile_widget.dart';

class CompletePageAnimal extends StatelessWidget {
  final String petName;
  final String chipNumber;
  final String birthday;
  final String petAddress;

  CompletePageAnimal({
    required this.petName,
    required this.chipNumber,
    required this.birthday,
    required this.petAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de $petName'),
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
                    builder: (context) => CompletePageHumano(
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
                    builder: (context) =>CompletePageHumano(
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
                    builder: (context) => CompletePageAnimal(
                      petName: 'Bobby',
                      chipNumber: '987654321234567',
                      birthday: '16/05/2022',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileWidget(
              imagePath: 'https://via.placeholder.com/150',
              onClicked: () async {},
            ),
            SizedBox(height: 20),
            Text(
              petName,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Informações adicionais:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Número do Chip: $chipNumber'),
            SizedBox(height: 5),
            Text('Endereço: $petAddress'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VaccinesAnimalPage()),
                );
              },
              child: Text('Vacinas'),
            ),
          ],
        ),
      ),
    );
  }
}