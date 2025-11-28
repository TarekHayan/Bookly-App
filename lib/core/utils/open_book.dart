import 'package:bookly_app/core/utils/show_snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openBook(BuildContext context, String? urlBook) async {
  if (urlBook == null || urlBook.isEmpty) {
    showSnackBar(context, "No link available");
    return;
  }
  Uri uri = Uri.parse(urlBook);

  // إذا كان الرابط http نقوم بإجباره ليكون https
  if (uri.scheme == 'http') {
    uri = uri.replace(scheme: 'https');
  }

  try {
    // 3. محاولة الفتح
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      // محاولة أخيرة: الفتح بدون التحقق (أحياناً canLaunchUrl تعطي نتيجة خاطئة)
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  } catch (e) {
    // طباعة الخطأ الحقيقي
    showSnackBar(context, "Could not launch book preview");
  }
}
