import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:interview_flutter_application/Features/Data/models.dart';
import 'package:interview_flutter_application/Features/Domain/home_usecase.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';



class UserBloc extends Bloc<UserEvent, UserState> {
  final HomeUsecase homeUsecase;
  UserBloc(this.homeUsecase) : super(UserInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
  }
  

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<UserState> emit) async{
    emit(HomeDataLoadingState());
    List<UserDataModel> userData = await homeUsecase.call();
    emit(HomeDataLoadedState(userData));
  }
}
