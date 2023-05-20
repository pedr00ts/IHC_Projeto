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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  List<CustomProfilePage> profiles = []; // Lista de perfis

  void _addProfile() {
    if (_formKey.currentState!.validate()) {
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
            address: address,
            profiles: [],
          ),
        ),
      );
    }
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
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthDateController.text = DateFormat('dd/MM/yyyy').format(picked);
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Adicione os campos com a informação necessária',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Nome:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Data de Nascimento:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _birthDateController,
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
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Número de Utente:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _idNumberController,
                  decoration: InputDecoration(
                    hintText: 'Número de Utente',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (value.length != 9) {
                      return 'O número de utente deve ter 9 dígitos';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Número de Telemóvel:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {},
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
                  onSaved: (PhoneNumber number) {
                    // You can save the phone number here if needed
                  },
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Morada:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
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
                    _addProfile();
                  },
                  child: Text('Adicionar Perfil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




