import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/home_cubit.dart';
import 'package:news/cubit/home_states.dart';

import 'component/Theme.dart';
import 'helpers/cash_helper.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
              style: primaryStyle(context),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.changeTheme();
                  },
                  icon: Icon(
                    Icons.brightness_2_outlined,
                    color: CashHelper.getData('isDark')
                        ? Colors.white
                        : Colors.black,
                  ))
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottoms,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
          ),
        );
      },
    );
  }
}
