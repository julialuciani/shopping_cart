import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_cart/api_request/usecase/products_usecase_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProductsProvider = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          getProductsProvider.when(
            data: (data) {
              return Expanded(
                child: ListView.builder(
                  itemCount: getProductsProvider.asData!.value.length,
                  itemBuilder: (context, index) {
                    return Text(getProductsProvider.asData!.value[index].title);
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              return const Text('Errooooooooooooooo');
            },
            loading: () {
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
