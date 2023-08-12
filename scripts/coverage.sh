flutter test --coverage
lcov --remove coverage/lcov.info '**/*.freezed.dart' '**/*.g.dart' 'lib/utils/extensions/*' 'lib/core/extensions/*' 'lib/core/services/models/*' 'lib/core/utils/enums/*' 'lib/repositories/mocks/*'  -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html