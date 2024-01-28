import 'package:eco_market/config/config.dart';

import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../main/presentation/widgets/custom_button_widget.dart';
import '../pages/cart/placing_an_order_page.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 400,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/svg/cart/bag.svg',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Заказ может быть при покупке свыше 300 с',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButtomWidget(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PlacingAnOrderPage())),
                text: 'Закрыть',
                height: 54,
              )
            ],
          ),
        ),
      );
    },
  );
}
