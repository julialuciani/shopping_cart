import 'package:flutter/material.dart';

import 'package:shopping_cart/payment_page/widgets/column_with_divider_and_list_tile.dart';

class PaymentPage extends StatefulWidget {
  static const route = "/payment";
  PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
  bool isPaymentSelected = false;
}

class _PaymentPageState extends State<PaymentPage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Text(
                "Seu pedido está quase concluído! \n Por favor confirme a forma de pagamento",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
              ),
            ),
            InkWell(
              onTap: () {
                widget.isPaymentSelected = !widget.isPaymentSelected;
                setState(() {});
              },
              child: const ColumnWithDividerAndListTile(
                title: "PIX",
                image: "assets/images/pix.png",
              ),
            ),
            InkWell(
              onTap: () {
                widget.isPaymentSelected = !widget.isPaymentSelected;
                setState(() {});
              },
              child: const ColumnWithDividerAndListTile(
                title: "BOLETO",
                image: "assets/images/boleto-logo.png",
              ),
            ),
            InkWell(
              onTap: () {
                widget.isPaymentSelected = !widget.isPaymentSelected;
                setState(() {});
              },
              child: const ColumnWithDividerAndListTile(
                title: "CARTÃO",
                image: "assets/images/mastercard.png",
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 10,
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      if (widget.isPaymentSelected) {
                        Navigator.of(context).pushNamed("/sucess-page");
                      }
                    },
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      backgroundColor: Colors.white,
                      side: BorderSide(
                          color: widget.isPaymentSelected
                              ? Colors.blue
                              : Colors.grey,
                          width: 1),
                      label: Text(
                        "Finalizar Compra",
                        style: TextStyle(
                            color: widget.isPaymentSelected
                                ? Colors.blue
                                : Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
