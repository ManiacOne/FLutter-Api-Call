import 'package:interview_flutter_application/Features/Data/models.dart';
import 'package:interview_flutter_application/Features/Domain/home_repository.dart';

class HomeUsecase{
  final HomeRepository homeRepository;

  HomeUsecase(this.homeRepository);

  Future<List<UserDataModel>> call()async{
    return await homeRepository.getData();
    }
}