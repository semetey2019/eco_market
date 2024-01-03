import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List _nameProducts = [
    "nknk",
    "nknk",
    "fgs",
    "vdfbf",
    "fdg",
    "dvdbfd",
    'dfegfe'
  ];
  final List _story = [
    "nknk",
    "nknk",
    "fgs",
    "vdfbf",
    "fdg",
    "dvdbfd",
    'dfegfe'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            )),
        title: const Text(
          "Продукты",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Быстрый поиск",
                hintStyle: TextStyle(color: Colors.grey[300]),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey[300],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            // Column(
            //   children: [
            //     Expanded(
            //       child: ListView.builder(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount: 7,
            //         itemBuilder: (context, index) {
            //           return getItem(index);

            // SizedBox(
            //   height: 20,
            //   width: 100,
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       // backgroundBlendMode: ,
            //       shape: BoxShape.rectangle,
            //       border: Border.all(
            //           strokeAlign: 20, width: 1, color: Colors.grey),
            //       color: Colors.grey[400],
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(10),
            //       ),
            //     ),
            //   ),
            // );
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => SecondScreen()),
            //     );
            //   },
            //   child: _nameProducts[index],

            //   // SizedBox(
            //   //   height: 20,
            //   //   width: 100,
            //   //   child: DecoratedBox(
            //   //     decoration: BoxDecoration(
            //   //       // backgroundBlendMode: ,
            //   //       shape: BoxShape.rectangle,
            //   //       border: Border.all(
            //   //           strokeAlign: 20, width: 1, color: Colors.grey),
            //   //       color: Colors.grey[400],
            //   //       borderRadius: const BorderRadius.all(
            //   //         Radius.circular(10),
            //   //       ),
            //   //     ),
            //   //   ),
            //   //   // child: Text(
            //   //   //   ' ${index + 1}',
            //   //   //   style: TextStyle(fontSize: 20),
            //   //   // ),
            //   // ),
            // );
            //     },
            //   ),
            // ),
          ],
        ),
        //   ]),
        // ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второй экран'),
      ),
      body: Center(
        child: Text('Детали второго экрана'),
      ),
    );
  }
}

Widget getItem(int index) {
  return Container(
    margin: EdgeInsets.all(10),
    alignment: Alignment.center,
    height: 30,
    color: Colors.amber,
    child: Text('Item $index'),
  );
}
