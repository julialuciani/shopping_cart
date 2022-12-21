import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  static const route = "/confirmation-page";
  const ConfirmationPage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Nome"),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("CPF"),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Data de Nascimento"),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("CEP"),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Endereço"),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                splashFactory: NoSplash.splashFactory,
                onTap: () {},
                child: const Chip(
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.blue, width: 1),
                    label: Text(
                      "Finalizar Compra",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
