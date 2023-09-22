/// The abstract class AppStartInitializer defines a method initialize() that needs to be implemented by
/// its subclasses.
abstract class AppStartInitializer {
  const AppStartInitializer();
  void initialize();
}

/// The abstract class AppStartInitializer defines a future method initialize() that needs to be implemented by
/// its subclasses.
abstract class FutureAppStartInitializer implements AppStartInitializer {
  const FutureAppStartInitializer() : super();

  @override
  Future<void> initialize();
}
