// import 'package:flutter/material.dart';

// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});

//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'История заказов',
//           style: TextStyle(
//             color: Color.fromARGB(255, 4, 2, 2),
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: const Padding(
//         padding: EdgeInsets.only(left: 16, right: 16),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Сегодня",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                     color: Colors.grey),
//                 textAlign: TextAlign.start,
//               ),
//               SizedBox(height: 12),
//               // SizedBox(
//               //   height: 70,
//               //   width: double.infinity,
//               //   child: DecoratedBox(
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.circular(16),
//               //       color: Colors.red,
//               //     ),
//               //   ),
//               // ),
//             ]),
//       ),
//     );
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_screen_state.dart';

class StoryScreenCubit extends Cubit<StoryScreenState> {
  StoryScreenCubit() : super(StoryScreenInitial());
}
