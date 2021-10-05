import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class ProductService {
  static final instance = ProductService._internal();

  factory ProductService() {
    return instance;
  }

  ProductService._internal();

  Future<dynamic> getProducts(BuildContext context) async {
    final header = {
      "Content-Type": "application/json",
    };

    /*Map jsonData = {
      'fullName': name,
      'email': email,
      'password': utils.convertSha1(password),
      'accountType': "TC"
    };*/

    //var body = jsonEncode(jsonData);
    //print("Parameters Registro ${jsonData}");

    final response = await http
        .post(
            "https://api.bazzaio.com/v5/listados/listar_productos_tienda/590/0/",
            headers: header)
        .timeout(Duration(seconds: 25))
        .catchError((value) {
      print("Ocurrio un errorTimeout" + value);
      throw Exception(value);
    });

    print("Json ListProducts: ${response.body}");

    return response.body;
  }
}
