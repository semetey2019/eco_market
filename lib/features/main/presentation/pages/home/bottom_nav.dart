import 'package:eco_market/features/main/presentation/pages/home/home.dart';
import 'package:eco_market/features/main/presentation/pages/product/product.dart';
import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int _currentIndex = 0;
  final screens = [
    const HomePage(),
    const ProductPage(),
    const Scaffold(),
    const Scaffold()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  label: "fdhfh",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "hreh",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.abc),
                ),
              ]),
        ));
  }
}
