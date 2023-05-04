import 'package:evaccine/profilepage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nifController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscrição'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adicione os campos com a sua informação',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Palavra-passe',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: repeatPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Repetir palavra-passe',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Nome',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: dobController,
              decoration: InputDecoration(
                hintText: 'Data de Nascimento',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: nifController,
              decoration: InputDecoration(
                hintText: 'Número de utente',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Número de telemóvel',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Morada',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para ação de inscrição
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage(
                    email: emailController.text,
                    name: nameController.text,
                    birthDate: dobController.text,
                    idNumber: nifController.text,
                    phoneNumber: phoneController.text,
                    address: addressController.text,
                  )),
                );
              },

              child: Text('Inscrever'),
            ),
          ],
        ),
      ),
    );
  }
}