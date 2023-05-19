import 'package:evaccine/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'adicionarvacinaanimal.dart';
import 'adicionarvacinapessoa.dart';
import 'loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eVaccine',
      initialRoute: '/',
      routes: {
        '/': (context) => EvaccinePage(),
        '/add_vaccineH': (context) => AddVaccinePage(),
        '/add_vaccineA': (context) => AddVaccineAnimalPage(),
      },
    );
  }
}

class EvaccinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eVaccine'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/vaccine.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300, // Largura desejada para os botões
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('ENTRAR'),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 300, // Largura desejada para os botões
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text('INSCREVER'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



