import '../services/abstract/dio_remote_data_service.dart';
import '../utils/helpers/dependency/core_dependencies.dart';
import 'base_remote_repository.dart';

abstract class BaseDioRemoteRepository implements BaseRemoteRepository {
  @override
  final DioRemoteDataService dataService;

  BaseDioRemoteRepository.defaultRemote() : dataService = kRemoteDataService;
  const BaseDioRemoteRepository.remote({required this.dataService});
}
