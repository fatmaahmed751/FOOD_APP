// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAfI_T4vWAVqGTh1xH54JkhFZ32DQEqWHo',
    appId: '1:556071551980:web:15a1458be9e508fc9636c9',
    messagingSenderId: '556071551980',
    projectId: 'food-app-1c628',
    authDomain: 'food-app-1c628.firebaseapp.com',
    storageBucket: 'food-app-1c628.appspot.com',
    measurementId: 'G-EDL94WXH12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCL0CDOkMKoyAHG6hXsSQlitfdvwFHaLKA',
    appId: '1:556071551980:android:9866fa88039da2549636c9',
    messagingSenderId: '556071551980',
    projectId: 'food-app-1c628',
    storageBucket: 'food-app-1c628.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBY8pr-KoJ2xg2kZ2vtAuSjGy_aCTfqxsU',
    appId: '1:556071551980:ios:0440672c887982a19636c9',
    messagingSenderId: '556071551980',
    projectId: 'food-app-1c628',
    storageBucket: 'food-app-1c628.appspot.com',
    iosBundleId: 'com.example.foodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBY8pr-KoJ2xg2kZ2vtAuSjGy_aCTfqxsU',
    appId: '1:556071551980:ios:fa1fe044fad1bc5f9636c9',
    messagingSenderId: '556071551980',
    projectId: 'food-app-1c628',
    storageBucket: 'food-app-1c628.appspot.com',
    iosBundleId: 'com.example.foodApp.RunnerTests',
  );
}
