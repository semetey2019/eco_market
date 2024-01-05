import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _currentIndex = 0;
  List<String> _products = [
    "Все",
    "Фрукты",
    "Сухофрукты",
    "Овощи",
    "Зелень",
    "Чай, кофе",
    'Молочные продукты'
  ];

  List<GridProductItem> gridProductItem = [];

  @override
  void initState() {
    super.initState();
    gridProductItem = [
      GridProductItem(
          title: 'Яблоко красная радуга сладкая',
          image: 'assets/images/apple.png',
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProductPage()));
          }),
      GridProductItem(
          title: 'Апельсины сладкий пакистанский',
          image: 'assets/images/orange.png',
          onTap: () {}),
      GridProductItem(
          title: 'Драконий фрукт',
          image: 'assets/images/dragon.png',
          onTap: () {}),
      GridProductItem(
          title: 'Яблоко золотая радуга',
          image: 'assets/images/apple.png',
          onTap: () {}),
      GridProductItem(
        title: 'Апельсины сладкий пакистанский',
        image: 'assets/images/orange.png',
        onTap: () {},
      ),
      GridProductItem(
        title: 'Яблоко красная радуга сладкая',
        image: 'assets/images/apple.png',
        onTap: () {},
      )
    ];
  }

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
        child: Column(
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
            const SizedBox(height: 20),
            SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(index)),
                          ),
                          child: SizedBox(
                            height: 30,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? null
                                    : Colors.grey[200],
                                gradient: _currentIndex == index
                                    ? const LinearGradient(
                                        begin: Alignment(0.80, -0.59),
                                        end: Alignment(-0.8, 0.59),
                                        colors: [
                                          Color(0xFF75DB1B),
                                          Color(0xFF75DB1B)
                                        ],
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 6, 18, 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _products[index],
                                      style: TextStyle(color: Colors.grey[500]),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 11.0,
                            crossAxisSpacing: 11.0,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            String svgPath = gridProductItem[index].image;
                            return InkWell(
                              onTap: gridProductItem[index].onTap,
                              child: SizedBox(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: AssetImage(svgPath),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Text(
                                    gridProductItem[index].title,
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
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
        title: Text('Продукты'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Детали элемента $index'),
      ),
    );
  }
}

class GridProductItem {
  GridProductItem({
    required this.title,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String image;
  final VoidCallback onTap;
}
