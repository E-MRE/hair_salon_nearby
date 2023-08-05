flutter test --coverage
lcov --remove coverage/lcov.info '**/*.freezed.dart' '**/*.g.dart' 'lib/utils/extensions/*' 'lib/repositories/mocks/*'  -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html