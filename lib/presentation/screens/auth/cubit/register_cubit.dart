import 'package:hair_salon_nearby/core/state_managers/bloc/cubit/base_cubit.dart';
import 'package:hair_salon_nearby/models/request/register_request_model.dart';
import 'package:hair_salon_nearby/presentation/screens/auth/cubit/register_state.dart';
import 'package:hair_salon_nearby/repositories/abstracts/register_repository.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit({required this.registerRepository}) : super(RegisterState.initial());

  final RegisterRepository registerRepository;

  Future<void> register(RegisterRequestModel registerRequestModel) async {
    final futureRequest = registerRepository.registerUser(registerRequestModel);
    await sendRequestResult(futureResultCallback: futureRequest);
  }
}
