import 'package:connectivity_plus/connectivity_plus.dart';
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
        onTap: () {},
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
                  InkWell(
                    onTap: () {
                      _showDialog(context);
                    },
                    child: const Text(
                      'Корзина 396 с',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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

  // Widget noInternet() {
  //   return Column(
  //     children: [
  //       Image.asset(
  //         "assets/images/connection.png",
  //         height: 224,
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(left: 20, bottom: 10),
  //         child: const Text("Отсутствует интернет  соединение",
  //             style: TextStyle(
  //               fontSize: 24,
  //               fontWeight: FontWeight.w700,
  //             )),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 20),
  //         child: const Text("Попробуйте подключить мобильный интернет",
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             )),
  //       ),
  //       CustomButtomWidget(
  //         text: "Ok",
  //         onPressed: () async {
  //           ConnectivityResult result =
  //               await Connectivity().checkConnectivity();
  //           print(result.toString());
  //         },
  //       )
  //     ],
  //   );
  // }

//////////////////// оформить заказ
  void _bottomSheet() {
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
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Image.asset(
                        'assets/images/dragon.png',
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        top: 50,
                        right: 40,
                        child: Icon(
                          Icons.restore_from_trash_sharp,
                          color: Colors.red,
                        ),
                      )
                    ]),
                    const Column(
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
                        const SizedBox(height: 15),
                        Text(
                          '340 с ',
                          style: TextStyle(
                            color: Color(0xFF75DB1B),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            fontSize: 15,
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
                    ),
                    Column(
                      children: [
                        Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(140),
                            1: FlexColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.top,
                          children: const <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Сумма',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      // '${reservation!.departure}',

                                      "396 c"),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Доставка',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      // '${reservation!.arrivalCountry}',
                                      "150"),
                                ),
                              ],
                            ),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    'Итого',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                      // '${reservation!.tourDateStart} – ${reservation!.tourDateStop}',
                                      "350"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    CustomButtomWidget(
                      text: 'Оформить заказ',
                      onPressed: () {},
                    )
                  ],
                ),
              ]),
            ),
          ),
        );
  }
}

// Future<String>checkAppConnectivity() async {
//     final connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.mobile) {
//       return "Mobile";
//     } else if (connectivityResult == ConnectivityResult.wifi) {
//      return "wifi";
//     } else if (connectivityResult == ConnectivityResult.ethernet) {
//      return "vpn";
//     } else if (connectivityResult == ConnectivityResult.other) {
//       return "blootuth";
//     } else if (connectivityResult == ConnectivityResult.none) {
//       return "no connected";
//     }
//   return "no connected";
//   }

// StreamBuilder(
//                       stream: Connectivity().onConnectivityChanged,
//                       builder: (context,
//                           AsyncSnapshot<ConnectivityResult> snapshot) {
//                         print(snapshot.toString());
//                         if (snapshot.hasData) {
//                           ConnectivityResult? result = snapshot.data;
//                           if (result == ConnectivityResult.mobile) {
//                             return connected('Mobile');
//                           } else if (result == ConnectivityResult.wifi) {
//                             return connected('WIFI');
//                           } else {
//                             return noInternet();
//                           }
//                         } else {
//                           return loading();
//                         }
//                       }),

Future<void> _showDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/connection.png",
              height: 224,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              child: const Text(
                "Отсутствует интернет соединение",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Попробуйте подключить мобильный интернет",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
            ),
            CustomButtomWidget(
              onPressed: () async {
                ConnectivityResult result =
                    await Connectivity().checkConnectivity();
                print(result.toString());
                Navigator.of(context).pop(); // Закрыть диалог
              },
              text: 'Ok',
            )
          ],
        ),
      );
    },
  );
}
