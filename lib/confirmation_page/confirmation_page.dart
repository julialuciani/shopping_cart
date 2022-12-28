import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmationPage extends StatefulWidget {
  static const route = "/confirmation-page";
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final _formKey = GlobalKey<FormState>();
  bool isFormValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        title: const Text(
          "Confirme seus dados",
          style: TextStyle(color: Colors.blue),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Nome"),
                ),
                validator: (value) {
                  if (value == "") {
                    return "Campo não pode ficar vazio!";
                  }

                  return null;
                },
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    isFormValid = true;
                  } else {
                    isFormValid = false;
                  }
                  setState(() {});
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("CPF"),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                validator: (value) {
                  if (value == "") {
                    return "Campo não pode ficar vazio!";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    isFormValid = true;
                  } else {
                    isFormValid = false;
                  }
                  setState(() {});
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Data de Nascimento"),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  DataInputFormatter(),
                ],
                validator: (value) {
                  if (value == "") {
                    return "Campo não pode ficar vazio!";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    isFormValid = true;
                  } else {
                    isFormValid = false;
                  }
                  setState(() {});
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("CEP"),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(),
                ],
                validator: (value) {
                  if (value == "") {
                    return "Campo não pode ficar vazio!";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    isFormValid = true;
                  } else {
                    isFormValid = false;
                  }
                  setState(() {});
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Endereço"),
                ),
                validator: (value) {
                  if (value == "") {
                    return "Campo não pode ficar vazio!";
                  }
                  return null;
                },
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    isFormValid = true;
                  } else {
                    isFormValid = false;
                  }
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed("/payment");
                  }
                },
                child: Chip(
                  labelPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: isFormValid ? Colors.blue : Colors.grey,
                    width: 1,
                  ),
                  label: Text(
                    "Finalizar Compra",
                    style: TextStyle(
                        color: isFormValid ? Colors.blue : Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
