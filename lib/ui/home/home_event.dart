part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeStarted extends HomeEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
