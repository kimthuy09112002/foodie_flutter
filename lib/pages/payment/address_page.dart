import 'package:flutter/material.dart';
import 'package:foodie_flutter/components/app_bar/foodie_app_bar.dart';
import 'package:foodie_flutter/components/app_dialog.dart';
import 'package:foodie_flutter/components/button/app_elevated_button.dart';
import 'package:foodie_flutter/models/address_model.dart';
import 'package:foodie_flutter/pages/payment/payment_page.dart';
import 'package:foodie_flutter/pages/payment/widget/address_item.dart';
import 'package:foodie_flutter/resources/app_color.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppBar(
        leftPressed: () => AppDialog.confirmExitApp(context),
        title: 'Choose Address',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: 26.0, bottom: 46.0),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => AddressItem(
                    onPressed: () {
                      for (var element in addresses) {
                        element.isSelected = false;
                      }
                      addresses[index].isSelected = true;
                      setState(() {});
                    },
                    address: addresses[index]),
                separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                itemCount: addresses.length,
              ),
              const SizedBox(height: 36.0),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 2, child: SizedBox()),
                  AppElevatedButton.smallOutline(
                    onPressed: () {},
                    text: 'Add New Address',
                    icon: const Icon(
                      Icons.add,
                      size: 18.0,
                      color: AppColor.red,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                ],
              ),
              // FractionallySizedBox(
              //   widthFactor: 0.6,
              //   child: AppElevatedButton.smallOutline(
              //     onPressed: () {},
              //     text: 'Add New Address',
              //     icon: const Icon(Icons.add, size: 18.0, color: AppColor.red),
              //   ),
              // ),
              const SizedBox(height: 60.0),
              AppElevatedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
                  (Route<dynamic> route) => false,
                ),
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
