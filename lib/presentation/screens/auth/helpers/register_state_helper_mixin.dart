part of '../view/register_page.dart';

mixin _RegisterStateHelperMixin on State<RegisterPage> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameSurnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  CityModel? _selectedCity;
  CountyModel? _selectedCounty;
  Gender? _gender;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _initControllers();
  }

  @override
  void dispose() {
    _nameSurnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _initControllers() {
    _nameSurnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  Future<void> _register(RegisterCubit cubit) async {
    if (cubit.state.status == StateStatus.loading) return;

    if (!(_formKey.currentState?.validate() ?? true)) {
      return;
    } else if (_selectedCity == null) {
      _displayUnselectedDropdownItemErrorMessage(LocaleKeys.registerForm_cityTitle.tr());
    } else if (_selectedCounty == null) {
      _displayUnselectedDropdownItemErrorMessage(LocaleKeys.registerForm_countyTitle.tr());
    } else if (_gender == null) {
      _displayUnselectedDropdownItemErrorMessage(LocaleKeys.gender_value.tr());
    } else {
      await cubit.register(_createRequestModel);
    }
  }

  void _setCity(CityModel city) {
    _selectedCity = city;
    _setCounty(null);
  }

  void _setCounty(CountyModel? county) {
    _selectedCounty = county;
  }

  void _setGender(Gender gender) {
    _gender = gender;
  }

  void _displayUnselectedDropdownItemErrorMessage(String item) {
    DisplaySnackBar(context).errorMessage(LocaleKeys.validators_unselectedDropdownItem.tr(args: [item]));
  }

  RegisterRequestModel get _createRequestModel {
    return RegisterRequestModel(
      name: _nameSurnameController.text.trim(),
      surname: _nameSurnameController.text.trim(),
      password: _passwordController.text.trim(),
      email: _emailController.text.trim(),
      gender: _gender ?? Gender.man,
      cityCountyId: _selectedCounty?.id ?? 0,
      platform: DependencyConstants.deviceInfo.platformType,
      version: DependencyConstants.deviceInfo.appVersion,
    );
  }
}
