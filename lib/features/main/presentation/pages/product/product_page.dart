import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/fruits_name.dart';
import '../../widgets/icon_button_widget.dart';
import '../../widgets/item_class.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Item> items = List.generate(8, (index) => Item());
  List<FruitsName> fruits = List.generate(7, (index) => FruitsName());
  bool isAdded = false;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Продукты',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
        child: SafeArea(
          child: Column(
            children: [
              ///////// Поиск товаров
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(
                    maxHeight: 46,
                  ),
                  filled: true,
                  fillColor: const Color(0xffF8F8F8),
                  hintText: 'Быстрый поиск',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 38,

                ////////  Выбрать ассортимент
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      FruitsName fruit = fruits[index];
                      return GestureDetector(
                        onTap: () => _onTabTapped(index),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: _currentIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              border: Border.all(
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: Text(
                              fruit.fruitsName[index],
                              style: TextStyle(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: fruits.length),
              ),
              const SizedBox(
                height: 20,
              ),

              ///////////  Выбрать товар
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 248,
                    crossAxisCount: 2,
                    mainAxisSpacing: 11.0,
                    crossAxisSpacing: 11.0,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    Item item = items[index];
                    return GestureDetector(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  index % 2 == 0
                                      ? 'assets/images/apple.png'
                                      : 'assets/images/orange.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                index % 2 == 0
                                    ? 'Яблоко красная радуга сладкая'
                                    : 'Апельсины сладкий пакистанский',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                index % 2 == 0 ? '56 с' : '86 с',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              index % 2 == 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButtonWidget(
                                            icon: Icons.remove,
                                            onTap: () {
                                              setState(() {
                                                item.decrementCounter();
                                              });
                                            }),
                                        Text(
                                          item.getCounter().toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        IconButtonWidget(
                                            icon: Icons.add,
                                            onTap: () {
                                              setState(() {
                                                item.incrementCounter();
                                              });
                                            })
                                      ],
                                    )
                                  : CustomButtomWidget(
                                      height: 32,
                                      text: 'Добавить',
                                      onPressed: () => showRule(context, item),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
///////////////////////    Кoрзина

      floatingActionButton: GestureDetector(
        onTap: () {
          showRule1(context, Item());
        },
        child: SizedBox(
          width: 168,
          height: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/svg/bag.svg',
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                  const Text(
                    'Корзина 396 с',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
//////////////////  Добавить товар

  showRule(BuildContext context, Item item) => showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        // showDragHandle: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (BuildContext context) => StatefulBuilder(
          builder: (context, StateSetter setState) => Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/orange.png',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Апельсины сладкий пакистанский',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      '56 c шт',
                      style: TextStyle(
                        color: Color(0xFF75DB1B),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    text(
                      'Cочный плод яблони, который употребляется в пищу в свежем и запеченном виде, служит сырьём в кулинарии и для приготовления напитков.',
                    ),
                    const SizedBox(height: 24),
                    isAdded
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '112 с',
                                style: TextStyle(
                                  color: Color(0xFF1E1E1E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButtonWidget(
                                    icon: Icons.remove,
                                    onTap: () {
                                      setState(
                                        () {
                                          item.decrementCounter();
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    width: 44,
                                  ),
                                  Text(
                                    item.getCounter().toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 44,
                                  ),
                                  IconButtonWidget(
                                      icon: Icons.add,
                                      onTap: () {
                                        setState(() {
                                          item.incrementCounter();
                                        });
                                      })
                                ],
                              ),
                            ],
                          )
                        : CustomButtomWidget(
                            text: 'Добавить',
                            onPressed: () {
                              setState(
                                () {
                                  isAdded = true;
                                },
                              );
                            },
                            height: 54,
                          ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget text(
    String text,
  ) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFABABAD),
        fontSize: 16,
      ),
    );
  }

  Widget loading() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  Widget connected(String type) {
    return Center(
      child: Text(
        '$type Connected',
        style: const TextStyle(color: Colors.green),
      ),
    );
  }
}

//////////////////// оформить заказ

showRule1(BuildContext context, Item item) => showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      // showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, StateSetter setState) => Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: Stack(children: [
                      Image.asset(
                        'assets/images/dragon.png',
                        height: 100,
                        width: 86,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 25,
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 38,
                            width: 38,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    title: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Драконий фрукт',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Цена 340 с за шт',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '340 с ',
                          style: TextStyle(
                            color: Color(0xFF75DB1B),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            IconButtonWidget(
                              icon: Icons.remove,
                              onTap: () {
                                setState(
                                  () {
                                    item.decrementCounter();
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              item.getCounter().toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButtonWidget(
                              icon: Icons.add,
                              onTap: () {
                                setState(() {
                                  item.incrementCounter();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ));
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: 15),
        ),
      ),
    );
