import 'package:interview_flutter_application/Features/Data/models.dart';

abstract class HomeRepository{
  Future<List<UserDataModel>> getData();
}