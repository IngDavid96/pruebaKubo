import 'package:flutter/material.dart';
import 'package:flutter_test_kubo/src/Models/ProductModel.dart';
import 'package:flutter_test_kubo/src/Providers/detailprovider.dart';
import 'package:flutter_test_kubo/src/Providers/listProductProvider.dart';
import 'package:flutter_test_kubo/src/Utils/utils.dart';
import 'package:flutter_test_kubo/src/Widgets/Widgets.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  DetailPage({Key key, this.product}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ListProductProvider listProductProvider;
  Detailprovider detailprovider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    listProductProvider = Provider.of<ListProductProvider>(context);
    return Column(
      children: [
        headerBack(widget.product.nombre, context),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: FadeInImage(
                        height: 300,
                        placeholder:
                            AssetImage('assets/images/placeholder.png'),
                        image: NetworkImage(widget.product.imagen)),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage(
                      height: 100,
                      width: 100,
                      placeholder: AssetImage('assets/images/placeholder.png'),
                      image: NetworkImage(widget.product.imagen)),
                ),
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 25, right: 25),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.nombre,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.person))
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.product.descripcion,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        r"$" +
                            utils.decimalFormat(
                                int.parse(widget.product.precio)),
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Text(
                        r"$" +
                            listProductProvider
                                .calculatePrecioPromo(widget.product),
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      boxAddLessCar(detailprovider),
                      SizedBox(height: 20),
                      addToCar()
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
