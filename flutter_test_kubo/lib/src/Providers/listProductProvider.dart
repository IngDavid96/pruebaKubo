import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'package:flutter_test_kubo/src/Models/ProductModel.dart';
import 'package:flutter_test_kubo/src/Services/listProductService.dart';
import 'package:flutter_test_kubo/src/Utils/utils.dart';

class ListProductProvider with ChangeNotifier {
  List<Product> _productsSearch = [];

  List<Product> get productsSearch => _productsSearch;

  bool _isSearch = false;

  bool get isSearch => _isSearch;

  set isSearch(bool value) {
    _isSearch = value;
    notifyListeners();
  }

  set productsSearch(List<Product> value) {
    _productsSearch = value;
    notifyListeners();
  }

  List<Product> _products = [];

  List<Product> get products => _products;

  set products(List<Product> value) {
    _products = value;
    notifyListeners();
  }

  double _precioDescuento = 0;

  double get precioDescuento => _precioDescuento;

  set precioDescuento(double value) {
    _precioDescuento = value;
    notifyListeners();
  }

  String calculatePrecioPromo(Product product) {
    var descuento = int.parse(product.valorPromo) / 100;
    precioDescuento = int.parse(product.precio) * descuento;
    precioDescuento = int.parse(product.precio) - precioDescuento;
    return utils.decimalFormat(precioDescuento.toInt());
  }

  searchProduct(String nameProduct) {
    /*for (var product in products) {
      if (product.nombre.contains(nameProduct)) {
        productsSearch.add(product);
      }
    }*/
    productsSearch = products
        .where((element) =>
            element.nombre.toLowerCase().contains(nameProduct.toLowerCase()))
        .toList();
  }

  serviceGetProduct(BuildContext context) async {
    utils.checkInternet().then((value) async {
      if (value) {
        utils.startProgress(context);
        Future callProducts = ProductService.instance.getProducts(context);
        await callProducts.then((product) {
          var decodeJSON = jsonDecode(product);

          ProductsResponse data = ProductsResponse.fromJson(decodeJSON);

          if (data.code == "100") {
            Navigator.pop(context);
            products = data.data;
          } else {
            Navigator.pop(context);
            utils.showSnackBarError(
                context, "Vuelve a intentarlo", "Ha ocurrido un error");
            //  Navigator.pop(context);
          }
        }, onError: (error) {
          Navigator.pop(context);
          utils.showSnackBarError(context, "Vuelve a intentarlo",
              "Ha ocurrido un error"); // Navigator.pop(context);
        });
      } else {
        utils.showSnackBarError(
            context, "Revisa tu conexion de internet", "Error de conexion");
      }
    });
  }
}
