import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/models/food.dart';
import 'package:flutter_application_2/screens/detail/widget/food_detail.dart';
import 'package:flutter_application_2/screens/detail/widget/food_image.dart';
import 'package:flutter_application_2/widgets/custome_app_bar.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  DetailPage(this.food);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(
              Icons.arrow_back_ios_outlined,
              Icons.favorite_outline,
              leftCallback: () => Navigator.of(context).pop(),
            ),
            FoodImg(food),
            FoodDetail(food),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 100,
        height: 56,
        child: RawMaterialButton(
            fillColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2,
            child: Row(
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    food.quantity.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            onPressed: () {}),
      ),
    );
  }
}
