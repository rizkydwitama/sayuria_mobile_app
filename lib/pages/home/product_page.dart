import 'package:flutter/material.dart';
import 'package:sayuria/models/product_model.dart';
import 'package:sayuria/pages/product_detail.dart';
import 'widgets/product_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

Future<List<ProductModel>> fetchProduct() async {
  final response = await http.get(
      Uri.parse('http://192.168.1.10:8000/api/product'));
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    var parsed = data.cast<Map<String, dynamic>>();
    return parsed.map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed');
  }
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<ProductModel>> products;

  @override
  void initState(){
    super.initState();
    products = fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const ProductAppBar(),
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0xffeef1f4),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search'
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  FutureBuilder<List<ProductModel>>(
                    future: products,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        if(snapshot.data!.isEmpty){
                          return const Center(
                            child: Text(
                              'Tidak berhasil mendapatkan data',
                              style: TextStyle(
                                fontSize: 30
                              ),
                            ),
                          );
                        }
                        return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.68,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 15),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index){
                              return Card(
                                child: GestureDetector(
                                  onTap: (){
                                    print(snapshot.data![index].nama_sayur);
                                    Navigator.push (
                                        context, MaterialPageRoute(
                                        builder: (context) => ProductDetail(products: {
                                          'namaSayur' : snapshot.data![index].nama_sayur,
                                          'harga' : snapshot.data![index].harga_sayur,
                                          'stock' : snapshot.data![index].stock,
                                          'deskripsi' : snapshot.data![index].deskripsi,
                                          'gambar' : snapshot.data![index].gambar
                                        })
                                    ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffeef1f4),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(15),
                                                child: Image.asset(
                                                  'assets/images/products/${snapshot.data![index].gambar}',
                                                ),
                                              )
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(left: 10),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Rp ${snapshot.data![index].harga_sayur.toString()}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(left: 10, top: 5),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot.data![index].nama_sayur,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(left: 10, top: 5),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Stock: ${snapshot.data![index].stock.toString()}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  )
                  /*
                  GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.68,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 15),
                    children: const [
                      ProductCard()
                    ]
                  )
                  */

                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
