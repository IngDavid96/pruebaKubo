import 'package:flutter/material.dart';
import 'package:flutter_test_kubo/src/Providers/detailprovider.dart';
import 'package:flutter_test_kubo/src/Providers/listProductProvider.dart';
import 'package:flutter_test_kubo/src/UI/listadoProductos.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProductProvider()),
        ChangeNotifierProvider(create: (_) => Detailprovider()),
      ],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          'listProducts': (BuildContext context) => ListProductsPage(),
        },
        initialRoute: 'listProducts',
        title: 'Flutter Test',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
