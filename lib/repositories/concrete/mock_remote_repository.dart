import '../../core/services/models/empty_entity_model.dart';
import '../../core/utils/mixins/error_message_by_api_response_mixin.dart';
import '../../core/utils/results/data_result.dart';
import '../../core/utils/results/result.dart';
import '../../models/entity/example_model.dart';
import '../abstract/example_repository.dart';

class MockRemoteRepository extends ExampleRepository with ErrorMessageByApiResponseMixin {
  MockRemoteRepository({required super.dataService}) : super.remote();

  @override
  Future<Result> add(ExampleModel data) async {
    final response = await dataService.postData<EmptyEntityModel>(
      fromMap: (json) => EmptyEntityModel().fromJson(json),
      endpoint: 'endpoint',
      request: data,
    );

    final message = getErrorMessage(
      defaultErrorMessage: 'An error occurred when add data to server',
      response: response,
    );

    return Result(success: response.success, message: message);
  }

  @override
  Future<DataResult<List<ExampleModel>>> getAll() async {
    return await dataService.getData<List<ExampleModel>>(
      fromMap: (json) => dataService.castFromJson<ExampleModel>(json, (json) => ExampleModel.fromJson(json)),
      endpoint: 'endpoint',
      queryParameters: Map.fromEntries([const MapEntry('key', 'value')]),
    );
  }

  @override
  Future<Result> remove(int id) async {
    final result = await dataService.postData<EmptyEntityModel>(
      fromMap: (json) => EmptyEntityModel().fromJson(json),
      endpoint: 'endpoint',
      request: ExampleModel(id: id),
    );

    final message = getErrorMessageFromDataResult(
      defaultErrorMessage: 'An error occurred when remove data from server',
      result: result,
    );

    return Result(success: result.success, message: message);
  }

  @override
  Future<Result> update(ExampleModel data) async {
    final response = await dataService.postData<ExampleModel>(
      fromMap: (json) => ExampleModel.fromJson(json),
      endpoint: 'endpoint',
      request: data,
    );

    return Result(success: response.success, message: response.message);
  }
}
