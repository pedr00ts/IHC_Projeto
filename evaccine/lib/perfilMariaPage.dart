import 'package:evaccine/vacinasaposUpload.dart';
import 'package:evaccine/vacinasaposadicionar.dart';
import 'package:evaccine/vacinashumanas.dart';
import 'package:evaccine/vacinassemnada.dart';
import 'package:flutter/material.dart';


import 'adicionarperfilfamiliapage.dart';
import 'adicionarperfilfanimalpage.dart';
import 'customprofilepage.dart';
import 'main.dart';
import 'mudarPerfil.dart';
import 'profiledetailspage.dart';
import 'widget/profile_widget.dart';

class PerfilMariaPage extends StatelessWidget {
  final String email;
  final String name;
  final String birthDate;
  final String idNumber;
  final String phoneNumber;
  final String address;
  final List<CustomProfilePage> profiles; // Lista de perfis adicionados

  const PerfilMariaPage({super.key,
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
        title: Text('Perfil de $name'),
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
            ListTile(
              title: Text(
                'Maria Luisa Oliveira',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilMariaPage(
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
              },
            ),
            ...profiles.map(
                    (profile) => /*ListTile(
                title: Text(profile),
              ),*/
                ListView.builder(
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    CustomProfilePage page = profiles[index];
                    return ListTile(
                      title: Text(page.name),
                      onTap: () {
                        // Navigate to the selected page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDetailsPage(page),
                          ),
                        );
                      },
                    );
                  },
                )
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
            ListTile(
              title: Text(
                'Terminar Sessão',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EvaccinePage(
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            'https://via.placeholder.com/150', // Imagem de perfil padrão
          ),
        ),*/
          ProfileWidget(
            imagePath: 'https://via.placeholder.com/150',
            onClicked: () async {},
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
          Text('Número de utente: $idNumber'),
          SizedBox(height: 5),
          Text('Número de telefone: $phoneNumber'),
          SizedBox(height: 5),
          Text('Endereço: $address'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VaccinesAdicionaPage()),
              );
            },
            child: Text('Vacinas'),
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Alterar foto de perfil',
        child: Icon(Icons.photo_camera),
      ),*/
    );
  }
}