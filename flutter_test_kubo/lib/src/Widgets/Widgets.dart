import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test_kubo/src/Providers/detailprovider.dart';
import 'package:flutter_test_kubo/src/Providers/listProductProvider.dart';
import 'package:flutter_test_kubo/src/Utils/Strings.dart';

Widget searchProduct(
    TextEditingController controller, ListProductProvider listProductProvider) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
    margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1.0)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                if (value.length >= 3) {
                  listProductProvider.isSearch = true;
                  listProductProvider.searchProduct(value);
                } else if (value.length == 0) {
                  listProductProvider.isSearch = false;
                }
              },
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: Strings.search,
                  hintStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black.withOpacity(0.5),
                  )),
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              cursorColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(Icons.search)
        ],
      ),
    ),
  );
}

Widget headerBack(String title, BuildContext context) {
  return Container(
    width: double.infinity,
    height: 50,
    child: Center(
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          )
        ],
      ),
    ),
  );
}

Widget boxAddLessCar(Detailprovider detailprovider) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(.6)),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_up,
                color: Colors.black,
              )),
          Text(
            "0",
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              )),
        ],
      ),
    ),
  );
}

Widget addToCar() {
  return Container(
    width: 300,
    height: 50,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: Colors.green,
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Text(
            "Agregar al carrito",
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      ),
    ),
  );
}
