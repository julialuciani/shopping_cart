import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static const route = "/sign-up-page";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool areFieldsFilled = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dayOfBirthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 120),
              TextFormField(
                controller: nameController,
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Nome"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O nome não pode ficar vazio";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Email"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O email não pode ficar vazio";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: cpfController,
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("CPF"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O CPF não pode ficar vazio";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: cepController,
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("CEP"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O CEP não pode ficar vazio";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: addressController,
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Endereço"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O Endereço não pode ficar vazio";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: dayOfBirthController,
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  label: Text("Data de nascimento"),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "A data não pode ficar vazio";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed("/login-page");
                      }
                    },
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: areFieldsFilled ? Colors.blue : Colors.grey,
                        width: 1,
                      ),
                      label: Text(
                        "Cadastrar",
                        style: TextStyle(
                            color: areFieldsFilled ? Colors.blue : Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text("Já tem conta?"),
              TextButton(
                onPressed: () {},
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
