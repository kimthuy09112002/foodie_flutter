import 'package:flutter/material.dart';
import 'package:foodie_flutter/components/app_box_shadow.dart';
import 'package:foodie_flutter/gen/assets.gen.dart';
import 'package:foodie_flutter/models/address_model.dart';
import 'package:foodie_flutter/resources/app_color.dart';
import 'package:foodie_flutter/resources/app_style.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    this.onPressed,
    required this.address,
  });

  final Function()? onPressed;
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: AppBoxShadow.boxShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address.titleFirst ?? '-:-',
                  style: AppStyle.h14Normal.copyWith(
                      color: AppColor.brown, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.6),
                  child: Image.asset(
                    (address.isSelected ?? false
                            ? Assets.images.radioButtonOn
                            : Assets.images.radioButtonOff)
                        .path,
                    width: 18.0,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              address.titleSecond ?? '-:-',
              style: AppStyle.h14Normal.copyWith(color: AppColor.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12.0),
            Text(
              address.description ?? '-:-',
              style: AppStyle.h14Normal.copyWith(color: AppColor.grey),
            ),
          ],
        ),
      ),
    );
  }
}
