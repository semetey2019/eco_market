import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eco_market/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//  StreamBuilder<ConnectivityResult>(
//           stream: Connectivity().onConnectivityChanged,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (!snapshot.hasData) {
//               return const Center(child: Text('Нет данных'));
//             }
//             var connectivityResult = snapshot.data;
//             if (connectivityResult == ConnectivityResult.mobile) {
//               return const Center(
//                   child: Text('Подключение через мобильную сеть'));
//             } else if (connectivityResult == ConnectivityResult.wifi) {
//               return const Center(child: Text('Подключение через Wi-Fi'));
//             } else {
//               return const Center(
//                   child: Text('Отсутствует подключение к интернету'));
//             }
//           },
//         );
      
