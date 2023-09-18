// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _ReleaseEnv {
  static const List<int> _enviedkeybaseUrl = [
    3423216174,
    3238882566,
    173549881,
    3858290748,
    2350788933,
    1846290724,
    3660079032,
    565955253,
    4221763343,
    773111247,
    621075184,
    1514313066,
    1110835034,
    4293905076,
    1122645342,
    1570388486,
    4111983227,
    3490561682,
    4097576646,
    2982055128,
    298914896,
    3147048702,
    2943650779,
    4234096226,
    2133921285,
    3637738951,
    4265417684,
    1898516695
  ];
  static const List<int> _envieddatabaseUrl = [
    3423216198,
    3238882674,
    173549901,
    3858290764,
    2350788918,
    1846290718,
    3660078999,
    565955226,
    4221763437,
    773111214,
    621075075,
    1514312975,
    1110835063,
    4293905089,
    1122645292,
    1570388586,
    4111983189,
    3490561777,
    4097576617,
    2982055093,
    298914943,
    3147048607,
    2943650731,
    4234096139,
    2133921322,
    3637738929,
    4265417701,
    1898516728
  ];
  static final String baseUrl = String.fromCharCodes(
    List.generate(_envieddatabaseUrl.length, (i) => i, growable: false)
        .map((i) => _envieddatabaseUrl[i] ^ _enviedkeybaseUrl[i])
        .toList(growable: false),
  );
  static const List<int> _enviedkeyclientId = [
    1464934938,
    2314165894,
    3875839448,
    1420178982,
    4070717012,
    3683298960,
    3247520914,
    1483203777
  ];
  static const List<int> _envieddataclientId = [
    1464935017,
    2314165987,
    3875839419,
    1420179028,
    4070716977,
    3683299044,
    3247520987,
    1483203749
  ];
  static final String clientId = String.fromCharCodes(
    List.generate(_envieddataclientId.length, (i) => i, growable: false)
        .map((i) => _envieddataclientId[i] ^ _enviedkeyclientId[i])
        .toList(growable: false),
  );
  static const List<int> _enviedkeyclientSecret = [
    3100923083,
    4166529288,
    1938583879,
    1921217715,
    512631404,
    1810021029
  ];
  static const List<int> _envieddataclientSecret = [
    3100923064,
    4166529389,
    1938583844,
    1921217729,
    512631305,
    1810021073
  ];
  static final String clientSecret = String.fromCharCodes(
    List.generate(_envieddataclientSecret.length, (i) => i, growable: false)
        .map((i) => _envieddataclientSecret[i] ^ _enviedkeyclientSecret[i])
        .toList(growable: false),
  );
  static final bool _enviedkeyisLoggerActive = false;
  static final bool isLoggerActive = _enviedkeyisLoggerActive ^ true;
  static final bool _enviedkeyisTest = true;
  static final bool isTest = _enviedkeyisTest ^ true;
}
