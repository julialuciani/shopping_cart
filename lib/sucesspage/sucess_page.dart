import 'package:flutter/material.dart';

class SucessPage extends StatelessWidget {
  static const route = "/sucess-page";
  const SucessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pushNamed("/");
            }),
        iconTheme: IconThemeData(color: Colors.grey.shade600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            Text(
              "Pedido Confirmado!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
