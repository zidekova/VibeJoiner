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
    apiKey: 'AIzaSyBeE7teWyqdFOOH0cKboOtJvmbKEnTD9kA',
    appId: '1:367485429697:web:ce3c0f911564126991f140',
    messagingSenderId: '367485429697',
    projectId: 'vibejoiner',
    authDomain: 'vibejoiner.firebaseapp.com',
    storageBucket: 'vibejoiner.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZ1Q8q1gEUrqZGUMUNXqGDh1weSBPxAyU',
    appId: '1:367485429697:android:b2f401640af7c6fb91f140',
    messagingSenderId: '367485429697',
    projectId: 'vibejoiner',
    storageBucket: 'vibejoiner.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1Ho2RjeKv7AoIcNond0Q3Nc4rENWt55E',
    appId: '1:367485429697:ios:3556bd3819bbba7791f140',
    messagingSenderId: '367485429697',
    projectId: 'vibejoiner',
    storageBucket: 'vibejoiner.firebasestorage.app',
    iosBundleId: 'com.example.vibejoiner',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1Ho2RjeKv7AoIcNond0Q3Nc4rENWt55E',
    appId: '1:367485429697:ios:3556bd3819bbba7791f140',
    messagingSenderId: '367485429697',
    projectId: 'vibejoiner',
    storageBucket: 'vibejoiner.firebasestorage.app',
    iosBundleId: 'com.example.vibejoiner',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBeE7teWyqdFOOH0cKboOtJvmbKEnTD9kA',
    appId: '1:367485429697:web:87a7de498bd4c63d91f140',
    messagingSenderId: '367485429697',
    projectId: 'vibejoiner',
    authDomain: 'vibejoiner.firebaseapp.com',
    storageBucket: 'vibejoiner.firebasestorage.app',
  );

}