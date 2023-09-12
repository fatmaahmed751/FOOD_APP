import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/custom_app_bar.dart';
import 'package:restaurant_app/widgets/menu_category_list_view.dart';
import 'package:restaurant_app/widgets/search_bar.dart';

class MenuCategoryView extends StatelessWidget {
  const MenuCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const[
          CustomAppBar(
            title: 'Desserts',
          ),
          SearchBarWidget(),
          Expanded(child: MenuCategoryListView()),
        ],
      ),
    );
  }
}
