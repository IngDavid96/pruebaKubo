import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test_kubo/src/Models/ProductModel.dart';
import 'package:flutter_test_kubo/src/Providers/listProductProvider.dart';
import 'package:flutter_test_kubo/src/UI/Detailpage.dart';
import 'package:flutter_test_kubo/src/Utils/utils.dart';

import 'package:flutter_test_kubo/src/Widgets/Widgets.dart';
import 'package:provider/provider.dart';

class ListProductsPage extends StatefulWidget {
  ListProductsPage({Key key}) : super(key: key);

  @override
  _ListProductsPageState createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  TextEditingController controller = TextEditingController();
  ListProductProvider listProductProvider;
  @override
  void initState() {
    listProductProvider =
        Provider.of<ListProductProvider>(context, listen: false);
    listProductProvider.serviceGetProduct(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    listProductProvider = Provider.of<ListProductProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Plaza',
          style: TextStyle(fontSize: 35.0, color: Colors.blue),
        ),
        SizedBox(
          height: 20.0,
        ),
        searchProduct(controller, listProductProvider),
        Expanded(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, left: 20.0, top: 20.0),
                      child: StaggeredGridView.countBuilder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 0),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        itemCount: listProductProvider.isSearch
                            ? listProductProvider.productsSearch.length
                            : listProductProvider.products.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4),
                                    width: 1.0)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      FadeInImage(
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        height: 130.0,
                                        image: NetworkImage(
                                          listProductProvider.isSearch
                                              ? listProductProvider
                                                  .productsSearch[index].imagen
                                              : listProductProvider
                                                  .products[index].imagen,
                                        ),
                                        placeholder: AssetImage(
                                            'assets/images/placeholder.png'),
                                      ),
                                      Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: Container(
                                          child: Center(
                                              child: Text(listProductProvider
                                                      .isSearch
                                                  ? listProductProvider
                                                          .productsSearch[index]
                                                          .valorPromo +
                                                      "%"
                                                  : listProductProvider
                                                          .products[index]
                                                          .valorPromo +
                                                      "%")),
                                          height: 30.0,
                                          width: 40.0,
                                          color: Colors.lightGreen,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listProductProvider.isSearch
                                                ? listProductProvider
                                                    .productsSearch[index]
                                                    .nombre
                                                : listProductProvider
                                                    .products[index].nombre,
                                            style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            r"$" +
                                                utils.decimalFormat(int.parse(
                                                    listProductProvider.isSearch
                                                        ? listProductProvider
                                                            .productsSearch[
                                                                index]
                                                            .precio
                                                        : listProductProvider
                                                            .products[index]
                                                            .precio)),
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.red,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                          Text(
                                            r"$" +
                                                listProductProvider
                                                    .calculatePrecioPromo(
                                                        listProductProvider
                                                                .isSearch
                                                            ? listProductProvider
                                                                    .productsSearch[
                                                                index]
                                                            : listProductProvider
                                                                    .products[
                                                                index]),
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      width: double.infinity,
                                      color: Colors.grey.shade100,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          product: listProductProvider
                                              .products[index],
                                        )));
                          },
                        ),
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.count(1, 1.17),
                        mainAxisSpacing: 13.07,
                        crossAxisSpacing: 7.74,
                      ),
                    ),
                  ],
                )))
      ],
    );
  }
}
