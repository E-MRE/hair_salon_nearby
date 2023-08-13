// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _ReleaseEnv {
  static const List<int> _enviedkeybaseUrl = [
    3559750864,
    2568736895,
    2586270904,
    4235314409,
    1884295789,
    61668446,
    2457214612,
    3563208505,
    1276113746,
    431333481,
    1921879091,
    3099270913,
    4282104145,
    33494655,
    655906784,
    4208183014,
    1842963671,
    2817524182,
    1193328372,
    1264490964,
    2153568238,
    3094476979,
    847888047,
    2281890053,
    1683022559,
    1439651593,
    1093319827,
    3596169934
  ];
  static const List<int> _envieddatabaseUrl = [
    3559750840,
    2568736779,
    2586270924,
    4235314329,
    1884295710,
    61668452,
    2457214651,
    3563208470,
    1276113712,
    431333384,
    1921879104,
    3099271012,
    4282104188,
    33494538,
    655906706,
    4208182922,
    1842963705,
    2817524149,
    1193328283,
    1264490937,
    2153568193,
    3094477010,
    847888095,
    2281890156,
    1683022576,
    1439651711,
    1093319842,
    3596169953
  ];
  static final String baseUrl = String.fromCharCodes(
    List.generate(_envieddatabaseUrl.length, (i) => i, growable: false)
        .map((i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i])
        .toList(growable: false),
  );
  static const List<int> _enviedkeyclientId = [
    1738776372,
    3438802344,
    1875129994,
    3035076222,
    2969320924,
    1116344077,
    3314740223,
    1544693910
  ];
  static const List<int> _envieddataclientId = [
    1738776391,
    3438802381,
    1875130089,
    3035076108,
    2969320889,
    1116344185,
    3314740150,
    1544694002
  ];
  static final String clientId = String.fromCharCodes(
    List.generate(_envieddataclientId.length, (i) => i, growable: false)
        .map((i) => _envieddataclientId[i] ^ _enviedkeyclientId[i])
        .toList(growable: false),
  );
  static const List<int> _enviedkeyclientSecret = [
    1012612011,
    3338855254,
    382162910,
    4086227475,
    1624498630,
    961946244
  ];
  static const List<int> _envieddataclientSecret = [
    1012612056,
    3338855219,
    382162877,
    4086227553,
    1624498595,
    961946352
  ];
  static final String clientSecret = String.fromCharCodes(
    List.generate(_envieddataclientSecret.length, (i) => i, growable: false)
        .map((i) => _envieddataclientSecret[i] ^ _enviedkeyclientSecret[i])
        .toList(growable: false),
  );
  static final bool _enviedkeyisLoggerActive = true;
  static final bool isLoggerActive = _enviedkeyisLoggerActive ^ false;
  static final bool _enviedkeyisTest = true;
  static final bool isTest = _enviedkeyisTest ^ true;
}
