import 'package:evaccine/vacinasanimais.dart';
import 'package:flutter/material.dart';

class PerfilAnimalRegistado extends StatelessWidget {
  final String petName;
  final String chipNumber;
  final String petAddress;

  PerfilAnimalRegistado({
    required this.petName,
    required this.chipNumber,
    required this.petAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil Animal Registrado'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Animal: $petName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Número do Chip: $chipNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Morada do Animal: $petAddress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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