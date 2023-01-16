import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const route = "/login-page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool areFieldsFilled = false;
  bool seePassword = false;

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
              const SizedBox(height: 240),
              TextFormField(
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
                onChanged: (value) {
                  if (_formKey.currentState!.validate()) {
                    areFieldsFilled = true;
                  }
                  setState(() {});
                },
                obscureText: !seePassword,
                decoration: InputDecoration(
                    label: const Text("Senha"),
                    suffixIcon: IconButton(
                        onPressed: () {
                          seePassword = !seePassword;
                          setState(() {});
                        },
                        icon: seePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.remove_red_eye))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "A senha não pode ficar vazia";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/");
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
                        "Finalizar Compra",
                        style: TextStyle(
                            color: areFieldsFilled ? Colors.blue : Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text("Não tem conta ainda?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/sign-up-page");
                    },
                    child: const Text("Se inscreva"),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
