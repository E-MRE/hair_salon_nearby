import '../services/abstract/remote_data_service.dart';
import '../utils/helpers/dependency/core_dependencies.dart';

abstract class BaseRemoteRepository {
  final RemoteDataService dataService;

  BaseRemoteRepository.remote({required this.dataService});
  BaseRemoteRepository.defaultRemote() : dataService = kRemoteDataService;
}
