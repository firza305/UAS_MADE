import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class ShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Belanja'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.itemCount,
        itemBuilder: (ctx, index) {
          final item = cartItems[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.imageUrl),
            ),
            title: Text(item.title),
            subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartProvider.removeItem(item);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Total Items: ${cartProvider.itemCount}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
