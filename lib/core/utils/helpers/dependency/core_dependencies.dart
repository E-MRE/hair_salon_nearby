import '../token/token_context.dart';
import 'get_it_injection_container.dart';

TokenContext get kTokenController => GetItInjectionContainer.instance.injector.get<TokenContext>();
