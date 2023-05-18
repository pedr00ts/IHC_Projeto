import 'package:evaccine/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:intl/intl.dart'; //para as datas
import 'package:intl_phone_number_input/intl_phone_number_input.dart'; // para n telm

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController nifController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
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
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = isKeyboardVisible ? 0.0 : 16.0;

    return Scaffold(
        appBar: AppBar(
        title: Text('Inscrição'),
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, bottomPadding),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Adicione os campos com a sua informação',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 16.0),
    TextField(
    controller: emailController,
    decoration: InputDecoration(
    hintText: 'Email',
    ),
    ),
    SizedBox(height: 8.0),
    TextField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
    hintText: 'Palavra-passe',
    ),
    ),
    SizedBox(height: 8.0),
    TextField(
    controller: repeatPasswordController,
    obscureText: true,
    decoration: InputDecoration(
    hintText: 'Repetir palavra-passe',
    ),
    ),
    SizedBox(height: 8.0),
    TextField(
    controller: nameController,
    decoration: InputDecoration(
    hintText: 'Nome',
    ),
    ),
    SizedBox(height: 8.0),
    /*TextField(
    controller: dobController,
    decoration: InputDecoration(
    hintText: 'Data de Nascimento',
    ),
    ), */
    TextField(
      controller: dobController,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode()); // Remove any existing focus
        _selectDate(context);
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.calendar_today),
        hintText: 'Data de Nascimento',
      ),
    ),
    SizedBox(height: 8.0),
    TextField(
    controller: nifController,
    decoration: InputDecoration(
    hintText: 'Número de utente',
    ),
    ),
    SizedBox(height: 20),
    /*
    TextField(
    controller: phoneController,
    decoration: InputDecoration(
    hintText: 'Número de telemóvel',
    ),
    ),*/
    InternationalPhoneNumberInput(
      //selectorType: PhoneNumberSelectorType.DIALOG,
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
      //autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: TextStyle(color: Colors.black),
      initialValue: PhoneNumber(isoCode: 'PT'),
      textFieldController: phoneController,
      formatInput: true,
      keyboardType: TextInputType.phone,
      inputBorder: OutlineInputBorder(),
      hintText: 'Número de telemóvel',
    ),
    SizedBox(height: 8.0),
    TextField(
    controller: addressController,
    decoration: InputDecoration(
    hintText: 'Morada',
    ),
    ),
    SizedBox(height: 16.0),
    ElevatedButton(onPressed: () {
// Adicione aqui a lógica para ação de inscrição
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            email: emailController.text,
            name: nameController.text,
            birthDate: dobController.text,
            idNumber: nifController.text,
            phoneNumber: phoneController.text,
            address: addressController.text, profiles: [],
          ),
        ),
      );
    },
      child: Text('Inscrever'),
    ),
    ],
    ),
    ),
    ),
      resizeToAvoidBottomInset: false,
    );
  }
}


