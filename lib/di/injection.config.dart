// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/dataSource/add_student_data_source.dart' as _i6;
import '../data/dataSource/home_data_source.dart' as _i4;
import '../data/repository/add_student_repository.dart' as _i7;
import '../data/repository/home_repository.dart' as _i5;
import 'dio_provider.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.DioProvider>(() => _i3.DioProvider());
  gh.factory<_i4.HomeRemoteDataSource>(
      () => _i4.HomeRemoteDataSource(gh<_i3.DioProvider>()));
  gh.factory<_i5.IHomeRepository>(
      () => _i5.HomeRepository(gh<_i4.HomeRemoteDataSource>()));
  gh.factory<_i6.SaveStudentRemoteDataSource>(
      () => _i6.SaveStudentRemoteDataSource(gh<_i3.DioProvider>()));
  gh.factory<_i7.ISaveStudentRepository>(
      () => _i7.SaveStudentRepository(gh<_i6.SaveStudentRemoteDataSource>()));
  return getIt;
}
