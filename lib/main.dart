import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/controllers/app_bloc/cubit.dart';
import 'package:restaurant_app/controllers/app_bloc/states.dart';
import 'package:restaurant_app/controllers/login_bloc/login_cubit.dart';

import 'package:restaurant_app/firebase_options.dart';
import 'package:restaurant_app/screens/desserts_screen.dart';
import 'package:restaurant_app/screens/first_page.dart';
import 'package:firebase_core/firebase_core.dart' ;
import 'package:restaurant_app/screens/login_screen.dart';
import 'package:restaurant_app/screens/splash_screen.dart';
import 'package:restaurant_app/shared/bloc_observer.dart';

import 'package:restaurant_app/widgets/menu_categories_section.dart';

import 'screens/home_screen.dart';
import 'screens/item_details.dart';
import 'screens/layout_screen.dart';
import 'screens/new.dart';
import 'screens/offers_screen.dart';
import 'screens/register_screen.dart';
import 'widgets/menu_view.dart';
import 'widgets/popular_restaurant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers:[
              BlocProvider(create: (context) =>AppCubit()..getData()..getRestaurant()..getRecentItems()..getPosition(),
              ),
              BlocProvider(create: (context) =>AppLoginCubit()
              ),
            ],
            child: BlocConsumer<AppCubit,AppStates>(
              listener:  (context,state){},
              builder: (context,state){
                return const MaterialApp(
                  home: LayoutScreen(),
                  // initialRoute: AppRouts.initialRoute,
                  debugShowCheckedModeBanner: false,
//routes: routes,
                );
              },

            ),
          );
        }
    );



  }
}
