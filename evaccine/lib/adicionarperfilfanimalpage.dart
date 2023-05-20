import 'package:evaccine/perfilanimalregistado.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewAnimalProfilePage extends StatefulWidget {
  @override
  _NewAnimalProfilePageState createState() => _NewAnimalProfilePageState();
}

class _NewAnimalProfilePageState extends State<NewAnimalProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  void _addPetProfile() {
    if (_formKey.currentState!.validate()) {
      // Obtenha os valores dos campos de texto
      String petName = _nameController.text;
      String chipNumber = _idNumberController.text;
      String birthDay = _birthdayController.text;
      String petAddress = _addressController.text;

      // Navegue para a página "PerfilAnimalRegistado" passando os dados como argumentos
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PerfilAnimalRegistado(
            petName: petName,
            chipNumber: chipNumber,
            birthDay: birthDay,
            petAddress: petAddress,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idNumberController.dispose();
    _birthdayController.dispose();
    _addressController.dispose();
    super.dispose();
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthdayController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Perfil de Animal de Estimação'),
      ),
      body: SingleChildScrollView(
      child:Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Nome do Animal:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Nome',
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
                'Número do Chip:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _idNumberController,
                decoration: InputDecoration(
                  hintText: 'Número do Chip',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (value.length != 15) {
                    return 'O número do chip deve ter 15 dígitos';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Data de Nascimento:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: _birthdayController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: 'dd/mm/yyyy',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
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
                'Morada do Animal:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: 'Morada',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addPetProfile();
                },
                child: Text('Adicionar Perfil de Animal'),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
