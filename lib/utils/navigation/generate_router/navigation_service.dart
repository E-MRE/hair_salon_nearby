import 'package:flutter/material.dart';

import 'navigation_enum.dart';

///Yönlendirme operasyonlarıdır. MaterialRoutePage metotları burada tutulabilir.
///! ek metotlara ihtiyaç olursa buraya yazılmalıdır!
///
/// Örnek Kullanımlar:
///
/// ```dart
/// context.read<NavigationService>().navigateToPage(page: NavigationPages.menu, data: 'Title');
/// ```
///
/// ```dart
/// context.read<NavigationService>().navigateAndRemoveUntil(page: NavigationPages.menu, data: 'Title');
/// ```
///
/// ```dart
/// context.read<NavigationService>().navigateAndRemoveUntil(page: NavigationPages.menu, data: 'Title');
/// ```
abstract class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Bir sayfadan diğerine geçiş yapmak için kullanılır.
  /// Stack mantığı ile çalışır. Önceki sayfa hali hazırda açık ve altta olur
  ///
  /// Parametreler:
  ///
  /// * [page]: Gideceğimiz sayfa buraya yazılır. `NavigationPages` girilmelidir.
  /// * [data]: Sayfaya göndereceğimiz bilgi buraya yazılır.
  /// * [T]: Açılan sayfadan önceki sayfaya haber vermek için kullanılır. Geriye ne döneceğimizi belirtiriz.
  ///
  /// `Dikkat`: gönderdiğin data tipi sayfanın istediği ile aynı olmalı yoksa hata alırsın!
  ///
  /// Örnek Kullanım:
  ///
  /// ```dart
  /// context.read<NavigationService>().navigateToPage(page: NavigationPages.menu, data: 'Title');
  /// ```
  ///
  /// Örnek Kullanım:
  ///
  /// ```dart
  /// final isWorked = await context.read<NavigationService>().navigateToPage<bool>(page: NavigationPages.menu, data: 'Title');
  /// ```
  Future<T?> navigateToPage<T>({required NavigationPages page, Object? data});

  /// Bir sayfadan diğerine geçiş yapmak için kullanılır.
  /// Daha önceki sayfalar silinir ve açılan sayfa root olur.
  ///
  /// Parametreler:
  ///
  /// * [page]: Gideceğimiz sayfa buraya yazılır. `NavigationPages` girilmelidir.
  /// * [data]: Sayfaya göndereceğimiz bilgi buraya yazılır.
  /// * [T]: Açılan sayfadan önceki sayfaya haber vermek için kullanılır. Geriye ne döneceğimizi belirtiriz.
  ///
  /// `Dikkat`: gönderdiğin data tipi sayfanın istediği ile aynı olmalı yoksa hata alırsın!
  ///
  /// Örnek Kullanım:
  ///
  /// ```dart
  /// context.read<NavigationService>().navigateAndRemoveUntil(page: NavigationPages.menu, data: 'Title');
  /// ```
  ///
  Future<T?> navigateAndRemoveUntil<T>({required NavigationPages page, Object? data});

  /// Root sayfasına geri dönmek için kullanılır.
  /// Varolan tüm sayfalar silinir ve ilk sayfamıza geri geliriz.
  ///
  /// Örnek Kullanım:
  ///
  /// ```dart
  /// context.read<NavigationService>().navigateToRoot();
  /// ```
  void navigateToRoot();
}
