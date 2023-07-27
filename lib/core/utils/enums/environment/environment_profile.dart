/**
 * There are environment profiles. When project initialize load some of them.
 * After the load operation you can access the environment values using `[DotEnvironmentType]` enums.
 */
enum EnvironmentProfile {
  test('assets/envs/test_environment.env'),
  product('assets/envs/test_environment.env');

  final String path;
  const EnvironmentProfile(this.path);
}
