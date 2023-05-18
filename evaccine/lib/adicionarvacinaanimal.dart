import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum VaccineStatus {
administered,
future,
overdue,
}

class AddVaccineAnimalPage extends StatefulWidget {
@override
_AddVaccineAnimalPageState createState() => _AddVaccineAnimalPageState();
}

class _AddVaccineAnimalPageState extends State<AddVaccineAnimalPage> {
TextEditingController _nameController = TextEditingController();
TextEditingController _lotController = TextEditingController();
TextEditingController _expiryController = TextEditingController();
VaccineStatus _selectedStatus = VaccineStatus.administered;

void _addVaccine() {
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
Navigator.pop(context); // Retorna para a página anterior
},
child: Text('Fechar'),
),
],
);
},
);
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
firstDate: DateTime(1930),
lastDate: DateTime.now(),
);

if (picked != null) {
setState(() {
_expiryController.text = DateFormat('yyyy-MM-dd').format(picked);
});
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Nova Vacina'),
),
body: Padding(
padding: EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Text(
'Nome da Vacina:',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
TextField(
controller: _nameController,
),
SizedBox(height: 10),
Text(
'Lote:',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
TextField(
controller: _lotController,
),
SizedBox(height: 10),
Text(
'Validade:',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
InkWell(
onTap: () {
_selectDate(context); // Chame o método para exibir o seletor de data
},
child: IgnorePointer(
child: TextField(
controller: _expiryController,
decoration: InputDecoration(
suffixIcon: Icon(Icons.calendar_today),
),
),
),
),
SizedBox(height: 10),
Text(
'Status:',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
DropdownButton<VaccineStatus>(
value: _selectedStatus,
onChanged: (newValue) {
setState(() {
_selectedStatus = newValue!;
});
},
items: [
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
);
}
}

