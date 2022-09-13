import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/component/Theme.dart';
import 'package:news/cubit/home_cubit.dart';
import 'package:news/cubit/home_states.dart';
import 'package:news/helpers/cash_helper.dart';
import 'package:news/helpers/dio_helper.dart';

import 'layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CashHelper.init();
   if  (await CashHelper.getData('isDark') == null) {
     CashHelper.putDate('isDark', true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => HomeCubit()..getBusiness()..getSports()..getScience()..getTechnology())],
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener:(context , state) {},
        builder: (context,state){
          HomeCubit cubit  = HomeCubit.get(context) ;
          return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          darkTheme: Themes.customDark,
          theme: Themes.customLight,
          themeMode:  CashHelper.getData('isDark')? ThemeMode.dark :ThemeMode.light,
          home: const HomeScreenLayout(),
        );},
      ),
    );
  }
}
