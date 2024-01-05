import 'package:flutter/material.dart';

import '../widgets/icon_button_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _currentIndex = 0;
  int _decrementCounter = 0;
  int _incrementCounter = 0;
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
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const ProductPage()));
        },
      ),
      GridProductItem(
        title: 'Апельсины сладкий пакистанский',
        image: 'assets/images/orange.png',
        onTap: () {},
      ),
      GridProductItem(
        title: 'Драконий фрукт',
        image: 'assets/images/dragon.png',
        onTap: () {},
      ),
      GridProductItem(
        title: 'Яблоко золотая радуга',
        image: 'assets/images/apple.png',
        onTap: () {},
      ),
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
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.grey[100]),
            ),
            const SizedBox(height: 20),
            SizedBox(
              child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {},
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
                              padding: const EdgeInsets.fromLTRB(18, 6, 18, 6),
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
                        return Column(
                          children: [
                            InkWell(
                                onTap: gridProductItem[index].onTap,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image(
                                          image: AssetImage(svgPath),
                                          fit: BoxFit.cover),
                                      Text(
                                        gridProductItem[index].title,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.start,
                                      ),
                                      const Text(
                                        "56 c",
                                        style: TextStyle(
                                          color: Colors.lightGreen,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButtonWidget(
                                              icon: Icons.remove,
                                              onTap: () {
                                                setState(() {
                                                  _decrementCounter--;
                                                });
                                              }),
                                          Text(
                                            _incrementCounter.toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          IconButtonWidget(
                                              icon: Icons.add,
                                              onTap: () {
                                                setState(() {
                                                  _incrementCounter++;
                                                });
                                              })
                                        ],
                                      )
                                      // : CustomButtomWidget(
                                      //   height: 32,
                                      //   text: 'Добавить',
                                      //   onPressed: () => showRule(context),
                                      // ),
                                    ],
                                  ),
                                ))
                          ],
                        );
                      })
                ]),
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
