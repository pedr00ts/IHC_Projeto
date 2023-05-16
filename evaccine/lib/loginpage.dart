import 'package:evaccine/profilepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem-vindo de volta!',
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
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a lógica para autenticar o usuário
                // ...

                // Se o usuário estiver autenticado com sucesso, navegue para a página de perfil
                bool isValidUser = true;
                if (isValidUser) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(
                        email: emailController.text,
                        name: "Nome do usuário",
                        birthDate: "01/01/2000",
                        idNumber: "123456",
                        phoneNumber: "123456789",
                        address: "Rua do exemplo, 123", profiles: [],
                      ),
                    ),
                  );
                } else {
                  // exibir mensagem de erro
                }
              },
              child: Text('Entrar'),
            ),

          ],
        ),
      ),
    );
  }
}
