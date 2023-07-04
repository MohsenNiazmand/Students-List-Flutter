
import 'package:injectable/injectable.dart';
import 'package:studentlist/data/data.dart';

import '../../di/dio_provider.dart';


@injectable
class SaveStudentRemoteDataSource{
   final DioProvider dioProvider;

   SaveStudentRemoteDataSource(this.dioProvider);


   Future<StudentData> saveStudent(
       String firstName, String lastName, String course, int score) async {
     final response = await dioProvider.dio().post('experts/student', data: {
       "first_name": firstName,
       "last_name": lastName,
       "course": course,
       "score": score
     });

     if (response.statusCode == 200) {
       return StudentData.fromJson(response.data);
     } else {
       throw Exception();
     }

   }

}