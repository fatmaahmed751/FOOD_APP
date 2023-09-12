import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/menu_categories_section.dart';
import 'package:restaurant_app/widgets/search_bar.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Menu',
        ),
        SearchBarWidget(),
        MenuCategoriesSection(),
      ],
    );
  }
}
