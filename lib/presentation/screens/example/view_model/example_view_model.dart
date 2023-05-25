import '../../../../core/state_managers/bloc/cubit/base_data_cubit.dart';
import '../../../../repositories/abstract/example_repository.dart';
import '../../../../repositories/concrete/mock_example_repository.dart';
import 'example_state.dart';

//Cubit ile hazırlanmış örnek bir viewmodel. İhtiyacın yoksa kaldır.
class ExampleCubit extends BaseDataCubit<ExampleState> {
  ExampleCubit({ExampleRepository? exampleRepository})
      : _exampleRepository = exampleRepository ?? MockExampleRepository(),
        super(ExampleState.initial());

  final ExampleRepository _exampleRepository;

  Future<void> getExamples() async {
    sendRequestDataResult(futureDataResult: _exampleRepository.getAll());
  }
}
