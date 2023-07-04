import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:studentlist/data/repository/add_student_repository.dart';

part 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  final IAddStudentRepository repository;
  AddStudentCubit(this.repository) : super(AddStudentInitial());


  Future<void> onSaveButtonClicked(String firstName, String lastName, String course, int score)async {
    try{
      emit(AddStudentLoading());
      var response=await repository.saveStudent(firstName, lastName, course, score);
      emit(AddStudentSuccess());
    }catch(e){
      AddStudentError(e.toString());
      debugPrint('AddStudent Cubit Error : $e ');
    }
  }

}
