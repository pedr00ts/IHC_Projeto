import 'package:evaccine/perfilMariaPage.dart';
import 'package:evaccine/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:evaccine/adicionarvacinapessoa.dart';

import 'adicionarperfilfamiliapage.dart';
import 'adicionarperfilfanimalpage.dart';
import 'main.dart';

enum StatusVacina {
  todas,
  administrada,
  futura,
  atraso,
}

class Vacina {
  final String nome;
  final StatusVacina status;

  Vacina({required this.nome, required this.status});
}

class VaccinesAdicionaPage extends StatefulWidget {
  @override
  _VaccinesAdicionaPageState createState() => _VaccinesAdicionaPageState();
}

class _VaccinesAdicionaPageState extends State<VaccinesAdicionaPage> {
  final List<Vacina> planoNacional = [
    Vacina(nome: 'Vacina 1', status: StatusVacina.administrada),
    Vacina(nome: 'Vacina 2', status: StatusVacina.futura),
    Vacina(nome: 'Vacina 3', status: StatusVacina.atraso),
  ]; // Lista de vacinas do Plano Nacional de Saúde

  final List<Vacina> outrasVacinas = [
    Vacina(nome: 'Vacina 4', status: StatusVacina.administrada),
  ]; // Lista de outras vacinas

  List<Vacina> vacinasFiltradasPlanoNacional = [];
  List<Vacina> vacinasFiltradasOutras = [];
  StatusVacina statusSelecionado = StatusVacina.todas;

  @override
  void initState() {
    super.initState();
    filtrarVacinas();
  }

  void filtrarVacinas() {
    setState(() {
      if (statusSelecionado == StatusVacina.todas) {
        vacinasFiltradasPlanoNacional = [...planoNacional];
        vacinasFiltradasOutras = [...outrasVacinas];
      } else {
        vacinasFiltradasPlanoNacional = planoNacional
            .where((vacina) => vacina.status == statusSelecionado)
            .toList();
        vacinasFiltradasOutras = outrasVacinas
            .where((vacina) => vacina.status == statusSelecionado)
            .toList();
      }
    });
  }

  String getStatusVacina(StatusVacina status) {
    switch (status) {
      case StatusVacina.administrada:
        return 'Administrada';
      case StatusVacina.futura:
        return 'Futura';
      case StatusVacina.atraso:
        return 'Atraso';
      default:
        return 'Todas';
    }
  }

  void uploadVacinasSNS(BuildContext context) async {
    // Simulando uma espera de 2 segundos para buscar as informações do SNS
    await Future.delayed(Duration(seconds: 2));

    // Exibindo uma mensagem de sucesso ao finalizar o "upload" das vacinas do SNS
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload de Vacinas do SNS'),
          content: Text('Vacinas do SNS foram importadas com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacinas'),
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
            ListTile(
              title: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewFamilyProfilePage(),
                    ),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewAnimalProfilePage(),
                    ),
                  );
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
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filtrar por:',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<StatusVacina>(
                  value: statusSelecionado,
                  onChanged: (StatusVacina? newValue) {
                    if (newValue != null) {
                      setState(() {
                        statusSelecionado = newValue;
                        filtrarVacinas();
                      });
                    }
                  },
                  items: StatusVacina.values.map((StatusVacina status) {
                    return DropdownMenuItem<StatusVacina>(
                      value: status,
                      child: Text(getStatusVacina(status)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Vacinas do Plano Nacional de Saúde',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: vacinasFiltradasPlanoNacional.length,
                  itemBuilder: (context, index) {
                    Vacina vacina = vacinasFiltradasPlanoNacional[index];
                    return ListTile(
                      title: Text(vacina.nome),
                      subtitle: Text(getStatusVacina(vacina.status)),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Outras Vacinas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: vacinasFiltradasOutras.length,
                  itemBuilder: (context, index) {
                    Vacina vacina = vacinasFiltradasOutras[index];
                    return ListTile(
                      title: Text(vacina.nome),
                      subtitle: Text(getStatusVacina(vacina.status)),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddVaccinePage()),
          );
        },
        label: Text('Adicionar Vacina'),
        icon: Icon(Icons.add),
      ),
    );
  }
}


