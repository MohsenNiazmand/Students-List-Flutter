import 'package:injectable/injectable.dart';

import '../../di/dio_provider.dart';
import '../data.dart';

@injectable
class HomeRemoteDataSource{
  final DioProvider dioProvider;

  HomeRemoteDataSource(this.dioProvider);


  Future<List<StudentData>> getStudents() async {
    final response = await dioProvider.dio().get('experts/student');
    final List<StudentData> students = [];
    if (response.data is List<dynamic>) {
      for (var element in (response.data as List<dynamic>)) {
        students.add(StudentData.fromJson(element));
      }
    }
    return students;
  }

}