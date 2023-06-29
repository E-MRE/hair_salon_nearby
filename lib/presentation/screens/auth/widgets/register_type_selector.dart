part of '../view/register_page.dart';

class _RegisterTypeSelector extends StatelessWidget {
  const _RegisterTypeSelector({required this.authType, required this.selectAuthType});

  final AuthType authType;
  final void Function(AuthType authType) selectAuthType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildSelection(AuthType.user)),
        EmptySpace.mediumWidth(),
        Expanded(child: _buildSelection(AuthType.business)),
      ],
    );
  }

  Widget _buildSelection(AuthType type) {
    return SelectableContainer(
      isSelected: authType == type,
      text: (type == AuthType.user ? LocaleKeys.register_user : LocaleKeys.register_business).tr(),
      onTap: () => selectAuthType(type),
    );
  }
}
