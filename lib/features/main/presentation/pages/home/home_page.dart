import 'package:eco_market/features/main/presentation/pages/product/product_page.dart';
import 'package:flutter/material.dart';

import '../../../../pages/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  routerScreen({required int index}) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  List<GridMenuItem> gridMenuItem = [];

  @override
  void initState() {
    super.initState();
    gridMenuItem = [
      GridMenuItem(
          title: 'Фрукты',
          image: 'assets/images/fruits.png',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProductPage()));
          }),
      GridMenuItem(
          title: 'Сухофрукты',
          image: 'assets/images/fruits1.png',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProductPage()));
          }),
      GridMenuItem(
          title: 'Овощи', image: 'assets/images/vegetables.png', onTap: () {}),
      GridMenuItem(
          title: 'Зелень', image: 'assets/images/fruit3.png', onTap: () {}),
      GridMenuItem(
          title: 'Чай кофе', image: 'assets/images/coffee.png', onTap: () {}),
      GridMenuItem(
        title: 'Молочные продукты',
        image: 'assets/images/milk.png',
        onTap: () {},
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Эко Маркет',
          style: TextStyle(
            color: Color.fromARGB(255, 4, 2, 2),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18,
          left: 16,
          right: 16,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 185,
            crossAxisCount: 2,
            mainAxisSpacing: 11.0,
            crossAxisSpacing: 11.0,
          ),
          itemCount: gridMenuItem.length,
          itemBuilder: (context, index) {
            String svgPath = gridMenuItem[index].image;
            return GestureDetector(
                onTap: gridMenuItem[index].onTap,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(svgPath), fit: BoxFit.cover),
                  ),
                  child: Stack(children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          begin: const Alignment(0.00, -1.00),
                          end: const Alignment(0, 1.8),
                          colors: [Colors.black.withOpacity(0), Colors.black],
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gridMenuItem[index].title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ));
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            routerScreen(index: index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'История',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'Инфо',
            ),
          ],
          selectedItemColor: const Color(0xff75db1b),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
