import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Sumsang Galaxy s23',
      price: 10,
      imageUrl:
          'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2023/05/03/IMG-20230503-WA0044-3569137058.jpg',
    ),
    Product(
      id: '2',
      title: 'Tas LV (Louis Van gall)',
      price: 20,
      imageUrl:
          'https://cdn0-production-images-kly.akamaized.net/0HRYIOdA9f8xKDvgPiRyNtAund8=/800x1066/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3403457/original/050703700_1615959663-WhatsApp_Image_2021-03-17_at_10.54.52_AM.jpeg',
    ),
    Product(
      id: '3',
      title: 'kutang cap tikus',
      price: 30,
      imageUrl: 'https://cf.shopee.co.id/file/db5655eaf2ec523d2fb0acc72395b7c8',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TokoOnline PDIP'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/shopping-list');
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              final cartProvider =
                  Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(products[index]);
            },
            child: GridTile(
              child: Image.network(
                products[index].imageUrl,
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                title: Text(
                  products[index].title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
