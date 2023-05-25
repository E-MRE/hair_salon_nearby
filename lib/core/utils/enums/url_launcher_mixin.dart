import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

mixin UrlLauncherMixin {
  Future<void> makePhoneCall(String phone, {VoidCallback? errorCallback}) async {
    try {
      final result = await canLaunchUrl(Uri(scheme: 'tel', path: phone));
      if (!result) {
        errorCallback?.call();
      } else {
        final isLauched = await launchUrl(Uri(scheme: 'tel', path: phone));
        isLauched ? null : errorCallback?.call();
      }
    } catch (error) {
      errorCallback?.call();
    }
  }

  Future<void> sendSms({required String phone, required String message, VoidCallback? errorCallback}) async {
    try {
      final result = await canLaunchUrl(Uri(scheme: 'sms', path: phone));
      if (!result) {
        errorCallback?.call();
      } else {
        final isLauched = await launchUrl(Uri(scheme: 'sms', path: phone));
        isLauched ? null : errorCallback?.call();
      }
    } catch (error) {
      errorCallback?.call();
    }
  }

  Future<void> openUrl({required String url, VoidCallback? errorCallback}) async {
    if (url.isEmpty) return;

    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      errorCallback?.call();
    }
  }
}
