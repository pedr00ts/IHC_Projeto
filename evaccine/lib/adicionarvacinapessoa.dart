import 'package:evaccine/vacinasaposadicionar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum VaccineStatus {
  choice,
  administered,
  future,
  overdue
}

enum VaccineType{
  choice,
  yes,
  no
}

class AddVaccinePage extends StatefulWidget {
  @override
  _AddVaccinePageState createState() => _AddVaccinePageState();
}

class _AddVaccinePageState extends State<AddVaccinePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lotController = TextEditingController();
  TextEditingController _expiryController = TextEditingController();
  VaccineStatus _selectedStatus = VaccineStatus.choice;
  VaccineType _selectedType = VaccineType.choice;
  final _formKey = GlobalKey<FormState>();

  void _addVaccine() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso'),
            content: Text('A vacina foi adicionada com sucesso.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Fecha o AlertDialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VaccinesAdicionaPage()),
                  ); // Navega para a nova página
                },
                child: Text('Fechar'),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  void dispose() {
    _nameController.dispose();
    _lotController.dispose();
    _expiryController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked); // Formato padrão para validação

      // Verificar se a data está em um dos formatos esperados
      if (RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(_expiryController.text)) {
        formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      } else if (RegExp(r'^\d{4}/\d{2}/\d{2}$').hasMatch(_expiryController.text)) {
        formattedDate = DateFormat('yyyy/MM/dd').format(picked);
      }

      setState(() {
        _expiryController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Vacina'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nome da Vacina:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Nome Vacina',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Lote:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _lotController,
                  decoration: InputDecoration(
                    hintText: 'Lote',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Validade:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _expiryController,
                        decoration: InputDecoration(
                          hintText: 'dd/mm/yyyy',
                        ),
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatório';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // Validar a entrada manual da data
                          // Aqui você pode adicionar a lógica de validação personalizada
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectDate(context); // Chame o método para exibir o seletor de data
                      },
                      icon: Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Status:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<VaccineStatus>(
                  value: _selectedStatus,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedStatus = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == VaccineStatus.choice) {
                      return 'Selecione um status';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: VaccineStatus.choice,
                      child: Text('--escolha a opção--'),
                    ),
                    DropdownMenuItem(
                      value: VaccineStatus.administered,
                      child: Text('Administrada'),
                    ),
                    DropdownMenuItem(
                      value: VaccineStatus.future,
                      child: Text('Futura'),
                    ),
                    DropdownMenuItem(
                      value: VaccineStatus.overdue,
                      child: Text('Atrasada'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Pertence ao Plano Nacional de Saúde:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<VaccineType>(
                  value: _selectedType,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == VaccineType.choice) {
                      return 'Selecione um tipo';
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem(
                      value: VaccineType.choice,
                      child: Text('--escolha a opção--'),
                    ),
                    DropdownMenuItem(
                      value: VaccineType.yes,
                      child: Text('Sim'),
                    ),
                    DropdownMenuItem(
                      value: VaccineType.no,
                      child: Text('Não'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _addVaccine();
                  },
                  child: Text('Adicionar Vacina'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



