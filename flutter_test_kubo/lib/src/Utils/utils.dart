import 'package:flutter/material.dart';

import 'package:flushbar/flushbar.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test_kubo/src/Utils/dialogLoading.dart';
import 'package:intl/intl.dart';

class _Utils {
  startProgress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => DialogLoadingAnimated());
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Widget showSnackBarError(BuildContext context, String message, String title) {
    return IgnorePointer(
      child: Flushbar(
        isDismissible: true,
        titleText: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        )),
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 40),
        title: title,
        animationDuration: Duration(milliseconds: 500),
        borderRadius: 30,
        backgroundColor: Colors.red,
        icon: Image(
          width: 20,
          height: 20,
          fit: BoxFit.contain,
          color: Colors.white,
          image: AssetImage("assets/images/close.png"),
        ),
        message: message,
        duration: Duration(seconds: 3),
      )..show(context),
    );
  }

  String decimalFormat(int number) {
    var f = new NumberFormat("###,###.###", "es_CO");
    //print("________"+f.format(number));
    return f.format(number);
  }
}

final utils = _Utils();
