

import 'package:injectable/injectable.dart';
import 'package:studentlist/data/data.dart';
import 'package:studentlist/data/dataSource/add_student_data_source.dart';
import 'package:studentlist/di/dio_provider.dart';


final dioProvider=DioProvider();
final addStudentRepository=AddStudentRepository(SaveStudentRemoteDataSource(dioProvider));

abstract class IAddStudentRepository{
  Future<StudentData> saveStudent(
      String firstName, String lastName, String course, int score);
}

@Injectable(as: IAddStudentRepository)
@Injectable(as: SaveStudentRemoteDataSource)
class AddStudentRepository extends IAddStudentRepository{
  final SaveStudentRemoteDataSource remoteDataSource;

  AddStudentRepository(this.remoteDataSource);
  @override
  Future<StudentData> saveStudent(String firstName, String lastName, String course, int score) {
    return remoteDataSource.saveStudent(firstName, lastName, course, score);
  }

}