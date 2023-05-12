import 'package:dio/dio.dart';
import 'package:interview_flutter_application/Core/Api/api.dart';
import 'package:interview_flutter_application/Features/Data/models.dart';
import 'package:interview_flutter_application/Features/Data/remote_source.dart';

class RemoteSourceImpl implements RemoteSource{
  Api api =Api();
  @override
  Future<List<UserDataModel>> getData() async{
   final response = await api.get(Api.baseURLpath);
   List<dynamic> userMaps = response;
   return userMaps.map((e) => UserDataModel.fromJson(e)).toList();
  }

}