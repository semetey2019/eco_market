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
        child: Column(children: [
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
                        onTap: () => _products,
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
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
