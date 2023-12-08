part of '../view/register_page.dart';

class _CityAndCountyDropdownRow extends StatelessWidget {
  const _CityAndCountyDropdownRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocDataProviderView<CityCubit, CityState>(
      create: (_) {
        final ee = CoreDependencies.getDependency<CityCubit>();
        return ee..getCities();
      },
      errorChildBuilder: (context, state) => _buildTextButton(context, LocaleKeys.tryAgain.tr()),
      successChildBuilder: (context, state) {
        if (state.data == null || state.data!.isEmpty) {
          return _buildTextButton(context, LocaleKeys.register_citiesNotFound.tr());
        }

        return Row(children: [
          const Expanded(child: CityDropdownByTitle()),
          EmptySpace.mediumWidth(),
          const Expanded(child: CountyDropdownByTitle()),
        ]);
      },
    );
  }

  TextButton _buildTextButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () async => await context.read<CityCubit>().getCities(),
      child: AppText.titleMediumRegular(
        text,
        context: context,
        align: TextAlign.center,
        color: context.colorScheme.error,
      ),
    );
  }
}
