import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

enum BrowserType {
  chrome,
  firefox,
  opera,
}

Future<void> launchBrowser({
  required BrowserType browserType,
  required String url,
}) async {
  if (Platform.isAndroid) {
    await _launchBrowserAndroid(browserType, url);
  } else if (Platform.isIOS) {
    await _launchBrowserIOS(browserType, url);
  } else {
    // TODO(K9i-0): implement for other platforms
  }
}

Future<void> _launchBrowserAndroid(
  BrowserType browserType,
  String url,
) async {
  switch (browserType) {
    case BrowserType.chrome:
      final intent = AndroidIntent(
        action: 'action_view',
        data: url,
        package: 'com.android.chrome',
      );
      return await intent.launch();
    case BrowserType.firefox:
      final intent = AndroidIntent(
        action: 'action_view',
        data: url,
        package: 'org.mozilla.firefox',
      );
      return await intent.launch();
    case BrowserType.opera:
      final intent = AndroidIntent(
        action: 'action_view',
        data: url,
        package: 'com.opera.browser',
      );
      return await intent.launch();
  }
}

Future<void> _launchBrowserIOS(
  BrowserType browserType,
  String url,
) async {
  final String formattedUrl;
  switch (browserType) {
    case BrowserType.chrome:
      formattedUrl = url
          .replaceFirst('https://', 'googlechrome://')
          .replaceFirst('http://', 'googlechrome://');
      break;
    case BrowserType.firefox:
      formattedUrl = 'firefox://open-url?url=$url';
      break;
    case BrowserType.opera:
      formattedUrl = url
          .replaceFirst('https://', 'touch-https://')
          .replaceFirst('http://', 'touch-http://');
      break;
  }
  launchUrl(
    Uri.parse(formattedUrl),
    mode: LaunchMode.externalApplication,
  );
}
