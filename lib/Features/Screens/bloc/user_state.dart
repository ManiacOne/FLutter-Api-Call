part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class HomeDataLoadingState extends UserState{}

class HomeDataLoadedState extends UserState{
  final List<UserDataModel>userData;

  HomeDataLoadedState(this.userData);
}

