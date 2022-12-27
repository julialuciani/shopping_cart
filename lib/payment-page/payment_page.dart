import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  static const route = "/payment";
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: const Text(
          'Forma de pagamento',
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        children: const [
          Text(
              "Seu pedido está quase concluído! \n Por favor confirme a forma de pagamento"),
        ],
      ),
    );
  }
}
