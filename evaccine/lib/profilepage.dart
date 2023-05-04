import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String email;
  final String name;
  final String birthDate;
  final String idNumber;
  final String phoneNumber;
  final String address;

  ProfilePage({
    required this.email,
    required this.name,
    required this.birthDate,
    required this.idNumber,
    required this.phoneNumber,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do usuário'),
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
          Navigator.pushNamed(context, '/vaccines');
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
