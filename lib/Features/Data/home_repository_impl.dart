import 'package:interview_flutter_application/Features/Data/models.dart';
import 'package:interview_flutter_application/Features/Data/remote_source_impl.dart';
import 'package:interview_flutter_application/Features/Domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
  final RemoteSourceImpl remoteSourceImpl;

  HomeRepositoryImpl(this.remoteSourceImpl);
  @override
  Future<List<UserDataModel>> getData() async{
   return await remoteSourceImpl.getData();
  }

}