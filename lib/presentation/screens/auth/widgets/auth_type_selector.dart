part of '../view/login_page.dart';

class _AuthTypeSelector extends StatelessWidget {
  const _AuthTypeSelector({required this.authType, required this.selectAuthType});

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
      text: (type == AuthType.user ? LocaleKeys.authType_user : LocaleKeys.authType_business).tr(),
      onTap: () => selectAuthType(type),
    );
  }
}
