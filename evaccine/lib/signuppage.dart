import 'package:evaccine/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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

  final _formKey = GlobalKey<FormState>();

  bool _validateFields() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    // Validating email
    final email = emailController.text.trim();
    if (!email.contains('@')) {
      return false;
    }

    // Validating password match
    final password = passwordController.text;
    final repeatPassword = repeatPasswordController.text;
    if (password != repeatPassword) {
      return false;
    }

    // Validating ID number
    final idNumber = nifController.text.trim();
    if (idNumber.length != 9) {
      return false;
    }

    return true;
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
        dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscrição'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Email:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Campo obrigatório';
                        } else if (!value!.contains('@')) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Palavra-passe:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Palavra-passe',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Repetir Palavra-passe:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: repeatPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Repetir palavra-passe',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Nome:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Nome',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Data de Nascimento:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: dobController,
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
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Número de utente:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: nifController,
                      decoration: InputDecoration(
                        hintText: 'Número de utente',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Campo obrigatório';
                        } else if (value?.length != 9) {
                          return 'Número de utente inválido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Número de Telemóvel:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useEmoji: true,
                      ),
                      ignoreBlank: true, // Permitir campo em branco
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: PhoneNumber(isoCode: 'PT'),
                      textFieldController: phoneController,
                      formatInput: true,
                      keyboardType: TextInputType.phone,
                      inputBorder: OutlineInputBorder(),
                      hintText: 'Número de telemóvel',
                      onSaved: (PhoneNumber number) {
                        // You can save the phone number here if needed
                      },
                      validator: (value) {
                        // Validar o número de telemóvel aqui, se necessário
                        // Retorna null se for válido, ou uma mensagem de erro caso contrário
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Morada:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: 'Morada',
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_validateFields()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  email: emailController.text,
                                  name: nameController.text,
                                  birthDate: dobController.text,
                                  idNumber: nifController.text,
                                  phoneNumber: phoneController.text,
                                  address: addressController.text,
                                  profiles: [],
                                ),
                              ),
                            );
                          }
                        },
                        child: Text('Inscrever'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

