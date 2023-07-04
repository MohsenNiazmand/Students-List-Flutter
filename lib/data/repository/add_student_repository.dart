

import 'package:injectable/injectable.dart';
import 'package:studentlist/data/data.dart';
import 'package:studentlist/data/dataSource/add_student_data_source.dart';

abstract class ISaveStudentRepository{
  Future<StudentData> saveStudent(
      String firstName, String lastName, String course, int score);
}

@Injectable(as: ISaveStudentRepository)
@Injectable(as: SaveStudentRemoteDataSource)
class SaveStudentRepository extends ISaveStudentRepository{
  final SaveStudentRemoteDataSource remoteDataSource;

  SaveStudentRepository(this.remoteDataSource);
  @override
  Future<StudentData> saveStudent(String firstName, String lastName, String course, int score) {
    return remoteDataSource.saveStudent(firstName, lastName, course, score);
  }

}