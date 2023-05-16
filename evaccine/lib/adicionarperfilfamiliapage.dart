import 'package:evaccine/perfilhumanoregistado.dart';
import 'package:flutter/material.dart';

class NewFamilyProfilePage extends StatefulWidget {
  @override
  _NewFamilyProfilePageState createState() => _NewFamilyProfilePageState();
}

class _NewFamilyProfilePageState extends State<NewFamilyProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  void _addProfile() {
    // Lógica para adicionar o perfil ao seu banco de dados ou realizar outras ações necessárias

    // Obtenha os valores dos campos de texto
    String name = _nameController.text;
    String birthDate = _birthDateController.text;
    String idNumber = _idNumberController.text;
    String phoneNumber = _phoneNumberController.text;
    String address = _addressController.text;

    // Navegue para a página "PerfilHumanoRegistado" passando os dados como argumentos
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PerfilHumanoRegistado(
          name: name,
          birthDate: birthDate,
          idNumber: idNumber,
          phoneNumber: phoneNumber,
          address: address, profiles: [],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _idNumberController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Perfil de Família'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Nome:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
            ),
            SizedBox(height: 10),
            Text(
              'Data de Nascimento:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _birthDateController,
            ),
            SizedBox(height: 10),
            Text(
              'Número de Utente:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _idNumberController,
            ),
            SizedBox(height: 10),
            Text(
              'Número de Telemóvel:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _phoneNumberController,
            ),
            SizedBox(height: 10),
            Text(
              'Morada:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _addressController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addProfile();
              },
              child: Text('Adicionar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

