import 'package:evaccine/profilepage.dart';
import 'package:flutter/material.dart';

import 'completepageHumano.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Email:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (!value.contains('@')) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Palavra-passe:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Palavra-passe',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Adicione aqui a lógica para autenticar o usuário
                      // ...

                      // Se o usuário estiver autenticado com sucesso, navegue para a página de perfil
                      bool isValidUser = true;
                      if (isValidUser) {
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
                      } else {
                        // exibir mensagem de erro
                      }
                    }
                  },
                  child: Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

