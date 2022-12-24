import 'package:flutter/material.dart';
import 'package:multi_browser_launcher/multi_browser_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MultiBrowserLauncherDemoScreen(),
    );
  }
}

class MultiBrowserLauncherDemoScreen extends StatelessWidget {
  const MultiBrowserLauncherDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Browser Launcher Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // chrome
              TextButton(
                onPressed: () {
                  launchBrowser(
                    browserType: BrowserType.chrome,
                    url: 'https://flutter.dev',
                  );
                },
                child: const Text('launch chrome'),
              ),
              const SizedBox(height: 20),
              // firefox
              TextButton(
                onPressed: () {
                  launchBrowser(
                    browserType: BrowserType.firefox,
                    url: 'https://flutter.dev',
                  );
                },
                child: const Text('launch firefox'),
              ),
              const SizedBox(height: 20),
              // opera
              TextButton(
                onPressed: () {
                  launchBrowser(
                    browserType: BrowserType.opera,
                    url: 'https://flutter.dev',
                  );
                },
                child: const Text('launch opera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
