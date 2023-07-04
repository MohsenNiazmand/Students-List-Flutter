import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:studentlist/data/data.dart';
import 'package:studentlist/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async{
      if(event is HomeStarted){
        try{
          emit(HomeLoading());
          var response=await repository.getStudents();
          emit(HomeSuccess(response));
        }catch(e){
          emit(HomeError(e.toString()));
          debugPrint('Home Bloc Error : $e ');

        }


      }
    });
  }
}
