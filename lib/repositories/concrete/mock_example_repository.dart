import '../../core/services/abstract/remote_data_service.dart';
import '../../core/utils/results/data_result.dart';
import '../../core/utils/results/result.dart';
import '../../models/entity/example_model.dart';
import '../abstract/example_repository.dart';

class MockExampleRepository extends ExampleRepository {
  late final List<ExampleModel> _examples;

  Future get _getDelay => Future.delayed(const Duration(seconds: 2));

  MockExampleRepository({RemoteDataService? dataService}) : super.remote() {
    _examples = [
      ExampleModel(id: 1, name: 'Test'),
      ExampleModel(id: 2, name: 'Emre'),
      ExampleModel(id: 3, name: 'Merhaba'),
      ExampleModel(id: 4, name: 'Deneme'),
    ];
  }

  @override
  Future<Result> add(ExampleModel data) async {
    await _getDelay;
    _examples.add(data);
    if (data.id == null) return Result.error(message: 'Data id is null');
    return Result.success();
  }

  @override
  Future<DataResult<List<ExampleModel>>> getAll() async {
    await _getDelay;
    return DataResult.success(data: _examples);
  }

  @override
  Future<Result> remove(int id) async {
    await _getDelay;
    _examples.removeWhere((element) => element.id == id);
    return Result.success();
  }

  @override
  Future<Result> update(ExampleModel data) async {
    await _getDelay;
    final index = _examples.indexOf(data);

    if (index == -1) return Result.error(message: 'Data is not exists');

    _examples[index].id = data.id;
    _examples[index].name = data.name;

    return Result.success();
  }
}
