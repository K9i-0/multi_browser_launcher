Launch web browsers.

## Features

Supprt browsers
- Google Chrome
- Firefox
- Opera

## Getting started

Add dependency to your pubspec file.

```yaml
dependencies:
  multi_browser_launcher: <latest version>
```

## Usage

```dart
TextButton(
  onPressed: () {
    launchBrowser(
      browserType: BrowserType.chrome,
      url: 'https://flutter.dev',
    );
  },
  child: const Text('launch chrome'),
),
```

