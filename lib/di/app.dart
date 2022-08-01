import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dio_api_service.dart';
import 'package:ticketban_mobile/data/repository/auth_repository_impl.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/util/constant.dart';

final instance = GetIt.instance;

Future<void> initModule() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );
  instance.registerLazySingleton<Dio>(() => dio);

  //api service
  final DioApiService apiService = DioApiService(instance<Dio>());
  instance.registerLazySingleton<ApiService>(() => apiService);

  //shared preferences
  //todo

  //repositories
  final AuthRepository authRepository = AuthRepositoryImpl(
    instance<ApiService>(),
  );
  instance.registerLazySingleton(() => authRepository);
}
