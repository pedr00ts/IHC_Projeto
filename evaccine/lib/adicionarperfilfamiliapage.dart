import 'package:evaccine/customprofilepage.dart';
import 'package:evaccine/perfilhumanoregistado.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class NewFamilyProfilePage extends StatefulWidget {
  @override
  _NewFamilyProfilePageState createState() => _NewFamilyProfilePageState();
}

class _NewFamilyProfilePageState extends State<NewFamilyProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  List<CustomProfilePage> profiles = []; // Lista de perfis

  void _addProfile() {
    String name = _nameController.text;
    String birthDate = _birthDateController.text;
    String idNumber = _idNumberController.text;
    String phoneNumber = _phoneNumberController.text;
    String address = _addressController.text;

    CustomProfilePage newPage = CustomProfilePage(
      name: name,
      birthDate: birthDate,
      idNumber: idNumber,
      phoneNumber: phoneNumber,
      address: address,
      profiles: profiles,
    );

    setState(() {
      profiles.add(newPage);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PerfilHumanoRegistado(
          name: name,
          birthDate: birthDate,
          idNumber: idNumber,
          phoneNumber: phoneNumber,
          address: address, profiles: [],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _idNumberController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Perfil de Família'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Nome:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _nameController,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Data de Nascimento:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _birthDateController,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate(context);
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Número de Utente:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _idNumberController,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Número de Telemóvel:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  // Update the UI or perform any other necessary actions based on the validation status.
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useEmoji: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: PhoneNumber(isoCode: 'PT'),
                textFieldController: _phoneNumberController,
                formatInput: true,
                keyboardType: TextInputType.phone,
                inputBorder: OutlineInputBorder(),
                hintText: 'Número de telemóvel',
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Morada:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _addressController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addProfile();
                },
                child: Text('Adicionar Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


