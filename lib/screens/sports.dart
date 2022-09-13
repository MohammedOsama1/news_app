import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/component/Theme.dart';
import 'package:news/cubit/home_cubit.dart';
import 'package:news/cubit/home_states.dart';

import '../component/widgets/comp.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        List<dynamic> list = cubit.sports;
        return ConditionalBuilder(
          condition: list.isNotEmpty,
          builder: (BuildContext context) => ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return buildArticle(list[index],context);
              },
              separatorBuilder: (BuildContext context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(0.3),
                    ),
                  ),
              itemCount: list.length),
          fallback: (BuildContext context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}
