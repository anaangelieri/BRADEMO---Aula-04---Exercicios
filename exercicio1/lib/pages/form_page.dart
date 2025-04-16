import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'package:flutter/services.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cellController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormTextField(
                label: 'Nome',
                controller: _nameController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite seu nome'
                            : null,
                icon: Icons.person,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp('[0-9]')) //para não permitir a entrada de números
                ],
              ),
              SizedBox(height: 16),
              FormTextField(
                label: 'Celular',
                controller: _cellController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite seu celular'
                            : null,
                icon: Icons.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // para permitir apenas números
                  LengthLimitingTextInputFormatter(11), // limita a 11 caracteres 
                ],
              ),
              SizedBox(height: 16),
              FormTextField(
                label: 'Data de nascimento',
                controller: _dobController,
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Digite a data do seu nascimento'
                            : null,
                icon: Icons.calendar_today,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // para permitir apenas números
                  LengthLimitingTextInputFormatter(8), // limita a 8 caracteres 
                ],
              ),
              
              SizedBox(height: 22),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final cell = _cellController.text;
                    final dob = _dobController.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Nome: $name\nCelular: $cell\nData de Nascimento: $dob',
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
