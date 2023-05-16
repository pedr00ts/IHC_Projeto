import 'package:evaccine/perfilanimalregistado.dart';
import 'package:flutter/material.dart';

class NewAnimalProfilePage extends StatefulWidget {
  @override
  _NewAnimalProfilePageState createState() => _NewAnimalProfilePageState();
}

class _NewAnimalProfilePageState extends State<NewAnimalProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();


  void _addPetProfile() {
    // Lógica para adicionar o perfil do animal ao seu banco de dados ou realizar outras ações necessárias

    // Obtenha os valores dos campos de texto
    String petName = _nameController.text;
    String chipNumber = _idNumberController.text;
    String petAddress = _addressController.text;

    // Navegue para a página "PerfilAnimalRegistado" passando os dados como argumentos
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PerfilAnimalRegistado(
          petName: petName,
          chipNumber: chipNumber,
          petAddress: petAddress,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Perfil de Animal de Estimação'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Nome do Animal:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
            ),
            SizedBox(height: 10),
            Text(
              'Número do Chip:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _idNumberController,
            ),
            SizedBox(height: 10),
            Text(
              'Morada do Animal:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _addressController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addPetProfile();
              },
              child: Text('Adicionar Perfil de Animal'),
            ),
          ],
        ),
      ),
    );
  }
}