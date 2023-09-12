import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/widgets/menu_category_list_item.dart';
class MenuCategoryListView extends StatelessWidget {
  const MenuCategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 4.h,
      ),
      itemCount: 10,
      itemBuilder: (context,index)=>MenuCategoryListItem(),) ;
  }
}
