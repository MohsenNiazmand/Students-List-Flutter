


import 'package:injectable/injectable.dart';
import 'package:studentlist/data/dataSource/home_data_source.dart';
import 'package:studentlist/di/dio_provider.dart';

import '../data.dart';

final dioProvider=DioProvider();
final homeRepository=HomeRepository(HomeRemoteDataSource(dioProvider));

abstract class IHomeRepository{
  Future<List<StudentData>> getStudents();
}

@Injectable(as: IHomeRepository)
@Injectable(as: HomeRemoteDataSource)
class HomeRepository extends IHomeRepository{
  final HomeRemoteDataSource remoteDataSource;

  HomeRepository(this.remoteDataSource);
  @override
  Future<List<StudentData>> getStudents() {
    return remoteDataSource.getStudents();
  }

}