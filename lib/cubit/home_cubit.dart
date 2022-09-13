import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/home_states.dart';
import 'package:news/helpers/cash_helper.dart';
import 'package:news/helpers/dio_helper.dart';
import 'package:news/screens/business.dart';
import 'package:news/screens/science.dart';
import 'package:news/screens/sports.dart';

import '../screens/tec.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = const [
    SportsScreen(),
    BusinessScreen(),
    ScienceScreen(),
    TecScreen()
  ];
  List<BottomNavigationBarItem> bottoms = const [
    BottomNavigationBarItem(label: 'Sports', icon: Icon(Icons.sports_baseball)),
    BottomNavigationBarItem(label: 'Business', icon: Icon(Icons.business)),
    BottomNavigationBarItem(label: 'Science', icon: Icon(Icons.science)),
    BottomNavigationBarItem(label: 'Technology', icon: Icon(Icons.code)),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<dynamic> business = [];

  getBusiness() async {
    emit(LoadingBusinessState());
    return await DioHelper.getDate('v2/top-headlines', {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'e3c5f473d610444b91340acdcbf8f1dc'
    }).then((value) {
      business = value.data['articles'];

      emit(GetBusinessSucState());
    }).catchError((onError){
      emit(GetBusinessErrorState());

    });
  }

  List<dynamic> sports = [];

  getSports() async {
    emit(LoadingSportsState());

    await DioHelper.getDate('v2/top-headlines', {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'e3c5f473d610444b91340acdcbf8f1dc'
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsSucState());

    }).catchError((onError){emit(GetSportsErrorState());
    });
  }

  List<dynamic> science = [];

  getScience() async {
    emit(LoadingScienceState());

    await DioHelper.getDate('v2/top-headlines', {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'e3c5f473d610444b91340acdcbf8f1dc'
    }).then((value) {
      science = value.data['articles'];
      emit(GetScienceSucState());
    }).catchError((error){
      emit(GetScienceErrorState());

    });
  }

  List<dynamic> technology = [];

  getTechnology() async {
    emit(LoadingTecState());

    await DioHelper.getDate('v2/top-headlines', {
      'country': 'eg',
      'category': 'technology',
      'apiKey': 'e3c5f473d610444b91340acdcbf8f1dc'
    }).then((value) {
      technology = value.data['articles'];
      emit(GetTecSucState());

    }).catchError((onError){
      emit(GetTecErrorState());
    });
  }

  bool isDark = true;
  void changeTheme(){
    isDark= !isDark;
    CashHelper.putDate('isDark', isDark);
    emit(ChangeThemeState());
  }
}
