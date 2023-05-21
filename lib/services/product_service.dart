import 'dart:convert';
import 'package:sayuria/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService{
  String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/product';
    var headers = {'Content-type' : 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      List<ProductModel> products = [];

      for(var item in data){
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Gagal mendapatkan produk');
    }
  }
}