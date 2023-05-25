import '../services/abstract/remote_data_service.dart';

abstract class BaseRemoteRepository {
  final RemoteDataService dataService;

  BaseRemoteRepository.remote({required this.dataService});
}
