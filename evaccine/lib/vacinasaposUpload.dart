import 'package:flutter/material.dart';
import 'package:evaccine/adicionarvacinapessoa.dart';

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

class VaccinesUploadPage extends StatefulWidget {
  @override
  _VaccinesUploadPageState createState() => _VaccinesUploadPageState();
}

class _VaccinesUploadPageState extends State<VaccinesUploadPage> {
  final List<Vacina> planoNacional = [
    Vacina(nome: 'Vacina 1', status: StatusVacina.administrada),
    Vacina(nome: 'Vacina 2', status: StatusVacina.futura),
    Vacina(nome: 'Vacina 3', status: StatusVacina.atraso),
  ]; // Lista de vacinas do Plano Nacional de Saúde

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
      } else {
        vacinasFiltradasPlanoNacional = planoNacional
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
        return '';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Vacinas do Plano Nacional de Saúde',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButton<StatusVacina>(
                      value: statusSelecionado,
                      dropdownColor: Colors.blue, // Altere a cor aqui
                      onChanged: (value) {
                        setState(() {
                          statusSelecionado = value!;
                          filtrarVacinas();
                        });
                      },
                      items: [
                        DropdownMenuItem<StatusVacina>(
                          value: StatusVacina.todas,
                          child: Text('Todas'),
                        ),
                        DropdownMenuItem<StatusVacina>(
                          value: StatusVacina.administrada,
                          child: Text('Administradas'),
                        ),
                        DropdownMenuItem<StatusVacina>(
                          value: StatusVacina.futura,
                          child: Text('Futuras'),
                        ),
                        DropdownMenuItem<StatusVacina>(
                          value: StatusVacina.atraso,
                          child: Text('Atraso'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: vacinasFiltradasPlanoNacional.length,
              itemBuilder: (context, index) {
                Vacina vacina = vacinasFiltradasPlanoNacional[index];
                return Card(
                  child: ListTile(
                    title: Text(vacina.nome),
                    subtitle: Text(getStatusVacina(vacina.status)),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            FloatingActionButton.extended(
              onPressed: () {
                uploadVacinasSNS(context);
              },
              label: Text('Upload de Vacinas do SNS'),
              icon: Icon(Icons.upload),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Outras Vacinas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: vacinasFiltradasOutras.length,
              itemBuilder: (context, index) {
                Vacina vacina = vacinasFiltradasOutras[index];
                return Card(
                  child: ListTile(
                    title: Text(vacina.nome),
                    subtitle: Text(getStatusVacina(vacina.status)),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddVaccinePage()),
                );
              },
              label: Text('Adicionar Vacina'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}