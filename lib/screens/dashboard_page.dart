import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../product.dart';
import '../product_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<Product>>? futureProduct;
  Future<List<Product>> fetchProduct() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        // return Product.fromJson(jsonDecode(response.body));
        return jsonResponse.map((data) => Product.fromJson(data)).toList();
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load Product');
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  void initState() {
    futureProduct = fetchProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text(
            'Products',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        backgroundColor: Colors.grey,
        body: Center(
          child: FutureBuilder<List<Product>>(
              future: futureProduct,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // print(snapshot.data);
                  List<Product>? data = snapshot.data;
                  return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                          id: data[index].id!,
                          title: data[index].title,
                          price: data[index].price,
                          description: data[index].description,
                          category: data[index].category,
                          imageUrl: data[index].imageUrl,
                          rating: data[index].rating,
                          count: data[index].count,
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
