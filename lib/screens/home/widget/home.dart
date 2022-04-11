import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/colors.dart';
import 'package:flutter_application_2/models/restaurant.dart';
import 'package:flutter_application_2/screens/home/widget/food_list.dart';
import 'package:flutter_application_2/screens/home/widget/food_list_view.dart';
import 'package:flutter_application_2/screens/home/widget/restaurant_into.dart';
import 'package:flutter_application_2/widgets/custome_app_bar.dart';
// import 'package:smooth_page_indicator_smooth/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeAppBar(
            Icons.arrow_back_ios_outlined,
            Icons.search_outlined,
          ),
          RestauranInfo(),
          FoodList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, restaurant),
          Expanded(
              child: FoodListView(
            selected,
            (int index) {
              setState(() {
                selected = index;
              });
            },
            pageController,
            restaurant,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                    width: 10,
                    height: 10,
                    color: kBackground,
                    borderRadius: BorderRadius.circular(10),
                    dotBorder: DotBorder(
                      color: kPrimaryColor,
                      padding: 2,
                      width: 2,
                    )),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }

  SmoothPageIndicator(
      {PageController? controller,
      int? count,
      effect,
      void Function(dynamic index)? onDotClicked}) {}

  CustomizableEffect({dotDecoration, activeDotDecoration}) {}

  DotDecoration(
      {int? width,
      int? height,
      Color? color,
      BorderRadius? borderRadius,
      dotBorder}) {}

  // ignore: non_constant_identifier_names
  DotBorder({Color? color, int? padding, int? width}) {}
}
