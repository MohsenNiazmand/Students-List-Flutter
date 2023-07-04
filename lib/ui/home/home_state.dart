part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}


class HomeLoading extends HomeState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class HomeSuccess extends HomeState{
  final List<StudentData> students;

  HomeSuccess(this.students);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class HomeError extends HomeState{
  final String errorMessage;

  HomeError(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];

}