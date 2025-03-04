import 'package:fake_store_app/widgets/product_card.dart';
import 'package:fake_store_app/widgets/shopping_cart.dart';
import 'package:fake_store_app/widgets/theme_button.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import 'package:fake_store_app/services/api_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> products;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    products = ApiService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 목록'),
        actions: [ThemeButton(), ShoppingCart()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: '검색어를 입력하세요'),
            ),
          ),
          Expanded(child: _buildProductList()),
        ],
      ),
    );
  }

  // 처음 값이 없을때, 값이 생길때 ,오류가 생길때 처럼 빌더는 여러번 실행 될 수 있음.
  Widget _buildProductList() {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List products = snapshot.data as List<Product>;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        );
      },
    );
  }
}
