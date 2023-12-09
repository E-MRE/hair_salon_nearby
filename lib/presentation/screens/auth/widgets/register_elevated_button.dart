part of '../view/register_page.dart';

class _RegisterElevatedButton extends StatelessWidget {
  const _RegisterElevatedButton({super.key, required this.onRegister});

  final Future<void> Function(RegisterCubit cubit) onRegister;

  @override
  Widget build(BuildContext context) {
    return BaseBlocProviderView<RegisterCubit, RegisterState>(
      create: (_) => CoreDependencies.getDependency<RegisterCubit>(),
      listener: (context, state) {
        if (state.status == StateStatus.error) {
          DisplaySnackBar(context).errorMessage(state.errorMessage);
        } else if (state.isSuccess) {
          //TODO: add user data and navigate to other page
        }
      },
      defaultBuilder: (context, state) {
        return BigPrimaryElevatedButton(
          isLoading: state.status == StateStatus.loading,
          text: LocaleKeys.register_value.tr(),
          icon: const Icon(Icons.arrow_forward_rounded),
          onPressed: () async => await onRegister(context.read<RegisterCubit>()),
        );
      },
    );
  }
}
