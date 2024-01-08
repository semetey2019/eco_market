// Future<String>checkAppConnectivity() async {
//     final connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return "Mobile";
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//      return "wifi";
//     } else if (connectivityResult == ConnectivityResult.ethernet) {
//      return "vpn";
//     } else if (connectivityResult == ConnectivityResult.other) {
//       return "blootuth";
//     } else if (connectivityResult == ConnectivityResult.none) {
//       return "no connected";
//     }
//   return "no connected";
//   }

// StreamBuilder(
//                       stream: Connectivity().onConnectivityChanged,
//                       builder: (context,
//                           AsyncSnapshot<ConnectivityResult> snapshot) {
//                         print(snapshot.toString());
//                         if (snapshot.hasData) {
//                           ConnectivityResult? result = snapshot.data;
//                           if (result == ConnectivityResult.mobile) {
//                             return connected('Mobile');
//                           } else if (result == ConnectivityResult.wifi) {
//                             return connected('WIFI');
//                           } else {
//                             return noInternet();
//                           }
//                         } else {
//                           return loading();
//                         }
//                       }),

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

Future<void> _showDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/connection.png",
              color: Color(0xffD2DAE8),
              height: 224,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Text(
                "Отсутствует интернет соединение",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Попробуйте подключить мобильный интернет",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
            ),
            CustomButtomWidget(
              onPressed: () async {
                ConnectivityResult result =
                    await Connectivity().checkConnectivity();
                print(result.toString());
                Navigator.of(context).pop();
              },
              text: 'Ok',
            )
          ],
        ),
      );
    },
  );
}


  // Future<void> get shouDialog =>_showDialog();



 // Widget noInternet() {
  //   return Column(
  //     children: [
  //       Image.asset(
  //         "assets/images/connection.png",
  //         height: 224,
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(left: 20, bottom: 10),
  //         child: const Text("Отсутствует интернет  соединение",
  //             style: TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.w700,
  //             )),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 20),
  //         child: const Text("Попробуйте подключить мобильный интернет",
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             )),
  //       ),
  //       CustomButtomWidget(
  //         text: "Ok",
  //         onPressed: () async {
  //           ConnectivityResult result =
  //               await Connectivity().checkConnectivity();
  //           print(result.toString());
  //         },
  //       )
  //     ],
  //   );
  // 