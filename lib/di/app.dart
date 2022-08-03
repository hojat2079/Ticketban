import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketban_mobile/data/local/app_prefernces.dart';
import 'package:ticketban_mobile/data/remote/api_service.dart';
import 'package:ticketban_mobile/data/remote/dio_api_service.dart';
import 'package:ticketban_mobile/data/repository/auth_repository_impl.dart';
import 'package:ticketban_mobile/data/repository/ticket_user_repository_impl.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';
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
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  //repositories
  final AuthRepository authRepository = AuthRepositoryImpl(
    instance<ApiService>(),
    instance<AppPreferences>(),
  );
  await authRepository.loadTokenFromDb();
  instance.registerLazySingleton(() => authRepository);

  final TicketUserRepository ticketUserRepository = TicketUserRepositoryImpl(
    instance<ApiService>(),
  );
  instance.registerLazySingleton(() => ticketUserRepository);
}
