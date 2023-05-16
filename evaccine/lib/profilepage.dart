import 'package:evaccine/vacinashumanas.dart';
import 'package:flutter/material.dart';

import 'adicionarperfilfamiliapage.dart';
import 'adicionarperfilfanimalpage.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String name;
  final String birthDate;
  final String idNumber;
  final String phoneNumber;
  final String address;
  final List<String> profiles; // Lista de perfis adicionados

  ProfilePage({
    required this.email,
    required this.name,
    required this.birthDate,
    required this.idNumber,
    required this.phoneNumber,
    required this.address,
    required this.profiles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil do usuário'),
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
              ...profiles.map(
                    (profile) => ListTile(
                  title: Text(profile),
                ),
              ),
              ListTile(
                title: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewFamilyProfilePage()));
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
                title: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewAnimalProfilePage()));
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
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            'https://via.placeholder.com/150', // Imagem de perfil padrão
          ),
        ),
        SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(
          email,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 30),
        Text(
          'Informações adicionais:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('Data de nascimento: $birthDate'),
        SizedBox(height: 5),
        Text('Número de identificação: $idNumber'),
        SizedBox(height: 5),
        Text('Número de telefone: $phoneNumber'),
        SizedBox(height: 5),
        Text('Endereço: $address'),
        SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VaccinesPage()),
                );
              },
              child: Text('Vacinas'),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Alterar foto de perfil',
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}