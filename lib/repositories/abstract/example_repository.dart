import '../../core/repositories/base_remote_repository.dart';
import '../../core/utils/results/data_result.dart';
import '../../core/utils/results/result.dart';
import '../../models/entity/example_model.dart';

abstract class ExampleRepository extends BaseRemoteRepository {
  ExampleRepository.remote() : super.defaultRemote();

  Future<DataResult<List<ExampleModel>>> getAll();

  Future<Result> add(ExampleModel data);

  Future<Result> update(ExampleModel data);

  Future<Result> remove(int id);
}
