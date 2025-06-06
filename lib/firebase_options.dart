// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDyHzuPkmDUKAhT1sHvkndu9J9PX0w18ZY',
    appId: '1:103981826267:web:64934b7eb0f1f9bb3e8cfe',
    messagingSenderId: '103981826267',
    projectId: 'hungryfood-850fb',
    authDomain: 'hungryfood-850fb.firebaseapp.com',
    storageBucket: 'hungryfood-850fb.firebasestorage.app',
    measurementId: 'G-KQVMWJ1GZR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIZMbR2QX4wYiH_E2uYkMCv05eaVyyITs',
    appId: '1:103981826267:android:dacdaf32d5204c743e8cfe',
    messagingSenderId: '103981826267',
    projectId: 'hungryfood-850fb',
    storageBucket: 'hungryfood-850fb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1pi7CCDXrXenMsJyuibZ2YkQ_uOrGlYw',
    appId: '1:103981826267:ios:bd1d83327eb169183e8cfe',
    messagingSenderId: '103981826267',
    projectId: 'hungryfood-850fb',
    storageBucket: 'hungryfood-850fb.firebasestorage.app',
    iosBundleId: 'com.example.project1Test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1pi7CCDXrXenMsJyuibZ2YkQ_uOrGlYw',
    appId: '1:103981826267:ios:bd1d83327eb169183e8cfe',
    messagingSenderId: '103981826267',
    projectId: 'hungryfood-850fb',
    storageBucket: 'hungryfood-850fb.firebasestorage.app',
    iosBundleId: 'com.example.project1Test',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDyHzuPkmDUKAhT1sHvkndu9J9PX0w18ZY',
    appId: '1:103981826267:web:9500d18f3b31d5063e8cfe',
    messagingSenderId: '103981826267',
    projectId: 'hungryfood-850fb',
    authDomain: 'hungryfood-850fb.firebaseapp.com',
    storageBucket: 'hungryfood-850fb.firebasestorage.app',
    measurementId: 'G-DHECVL4PKK',
  );
}
