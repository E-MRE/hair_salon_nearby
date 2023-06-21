import '../enum/hair_salon_type.dart';
import '../enum/onboarding_option.dart';

mixin OnboardingOptionToSalonConverterMixin {
  HairSalonType convertToSalon(OnboardingOption option) {
    return switch (option) {
      OnboardingOption.men => HairSalonType.men,
      OnboardingOption.women => HairSalonType.women,
      OnboardingOption.beautyCentre => HairSalonType.beautyCentre,
    };
  }
}
