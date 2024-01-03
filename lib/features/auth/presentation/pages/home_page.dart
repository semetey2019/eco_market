import 'package:eco_market/features/auth/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

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
          title: '',
          image: 'assets/images/category.png',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProductPage()));
          }),
      GridMenuItem(
          title: '',
          image: 'assets/images/category1.png',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProductPage()));
          }),
      GridMenuItem(
          title: '', image: 'assets/images/category2.png', onTap: () {}),
      GridMenuItem(
          title: '', image: 'assets/images/category3.png', onTap: () {}),
      GridMenuItem(
          title: '', image: 'assets/images/category4.png', onTap: () {}),
      GridMenuItem(
        title: '',
        image: 'assets/images/category5.png',
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
            crossAxisCount: 2,
            mainAxisSpacing: 11.0,
            crossAxisSpacing: 11.0,
          ),
          itemCount: gridMenuItem.length,
          itemBuilder: (context, index) {
            String svgPath = gridMenuItem[index].image;
            return InkWell(
              onTap: gridMenuItem[index].onTap,
              child: SizedBox(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(svgPath), fit: BoxFit.cover),
                  ),
                  child: Text(
                    gridMenuItem[index].title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class GridMenuItem {
  GridMenuItem({
    required this.title,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;
}
