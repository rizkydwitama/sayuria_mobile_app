import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sayuria/models/product_model.dart';
import 'package:sayuria/pages/product_detail_navbar.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

Future<List<ProductModel>> fetchProduct() async {
  final response = await http.get(
      Uri.parse('http://192.168.1.10:8000/api/product/'));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var parsed = data.cast<Map<String, dynamic>>();
    return parsed.map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class _ProductDetailState extends State<ProductDetail> {
  late Future<List<ProductModel>> products;

  @override
  void initState(){
    super.initState();
    products = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    Widget header(){
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left, size: 30,)
                ),
                const Text(
                  'Detail Produk',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Image.asset('assets/images/ic_cart.png', width: 20,)
              ],
            ),
          ),
        ]
      );
    }
    return Scaffold(
      body: ListView(
        children: [
          header(),
          Image.asset(
            'assets/images/kembang_kol.png',
            width: MediaQuery.of(context).size.width,
            height: 315,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nama Produk',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                      'Stock: x',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8 ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  )
                                ]
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  )
                                ]
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                          'Rp x.xxx',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),
                    ],
                  ),
                ),

                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ProductDetailNavbar(),
    );
  }
}
