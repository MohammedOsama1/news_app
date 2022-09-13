import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';import '../component/widgets/comp.dart';


import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        List list =  cubit.business;
        return ConditionalBuilder(condition: list.isNotEmpty
            , builder:  (BuildContext context){

              return ListView.separated(itemBuilder: (BuildContext context, index) => buildArticle(list[index],context),
                  separatorBuilder: (BuildContext context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(0.3),
                    ),
                  ), itemCount: list.length);
            }, fallback:  (BuildContext context){return Center(child: const CircularProgressIndicator());});
      },
    );
  }
}
