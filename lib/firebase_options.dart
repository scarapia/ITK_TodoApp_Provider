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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC3njfw786hDymOTST38YgLDB7s99n-mrU',
    appId: '1:591104435822:web:407e5335c91c3c8b60687f',
    messagingSenderId: '591104435822',
    projectId: 'todoappproviderfirebase',
    authDomain: 'todoappproviderfirebase.firebaseapp.com',
    storageBucket: 'todoappproviderfirebase.appspot.com',
    measurementId: 'G-270ZFJS5PL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHqWQ8-V52GauUBgqXMFVO8Owth7G-aIc',
    appId: '1:591104435822:android:6c1161b6a0afb87760687f',
    messagingSenderId: '591104435822',
    projectId: 'todoappproviderfirebase',
    storageBucket: 'todoappproviderfirebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCM7oNhfYVvyrO2-FZec791aC7RlwhuS1I',
    appId: '1:591104435822:ios:f6b4580e3c3d19bc60687f',
    messagingSenderId: '591104435822',
    projectId: 'todoappproviderfirebase',
    storageBucket: 'todoappproviderfirebase.appspot.com',
    iosClientId: '591104435822-fmjmspr3n5hc1cml1mokq5l8n9e93i91.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoAppProvider',
  );
}
