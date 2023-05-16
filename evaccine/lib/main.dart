import 'package:evaccine/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'adicionarvacinapessoa.dart';
import 'loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eVaccine',
      initialRoute: '/',
      routes: {
        '/': (context) => EvaccinePage(),
        '/add_vaccine': (context) => AddVaccinePage(),

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Entrar'),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
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

