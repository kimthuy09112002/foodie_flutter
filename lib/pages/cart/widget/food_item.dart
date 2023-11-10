import 'package:flutter/material.dart';
import 'package:foodie_flutter/components/app_box_shadow.dart';
import 'package:foodie_flutter/components/app_rating_bar.dart';
import 'package:foodie_flutter/components/app_simmer.dart';
import 'package:foodie_flutter/models/food_model.dart';
import 'package:foodie_flutter/resources/app_color.dart';
import 'package:foodie_flutter/resources/app_style.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key, required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 6.0, top: 8.0, right: 12.0, bottom: 6.0),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: AppBoxShadow.boxShadow,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              food.imageStr ?? '',
              width: 110.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const AppSimmmer(),
            ),
          ),
          const SizedBox(width: 2.0),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        food.name ?? '-:-',
                        style: AppStyle.h16Normal.copyWith(
                          color: AppColor.brown,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        food.quantity == null ? '_x' : '${food.quantity!}x',
                        style: AppStyle.h16Normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    food.description ?? '-:-',
                    style: AppStyle.h12Normal.copyWith(
                        color: AppColor.grey, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 18.0),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Text('\$', style: AppStyle.h16Normal),
                    ),
                    Text(
                      food.price?.toStringAsFixed(2) ?? '-:-',
                      style: AppStyle.h20Normal.copyWith(color: AppColor.brown),
                    ),
                    const Spacer(),
                    AppRatingBar(
                        onRatingUpdate: (value) {}, rating: food.rating ?? 0.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
