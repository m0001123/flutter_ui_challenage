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
    apiKey: 'AIzaSyCXDpQEA5d-US3yYFXSnLvNth6KR_NExno',
    appId: '1:628743886259:web:fb696263f496650c6227c6',
    messagingSenderId: '628743886259',
    projectId: 'flutter-demo-2d6c3',
    authDomain: 'flutter-demo-2d6c3.firebaseapp.com',
    storageBucket: 'flutter-demo-2d6c3.appspot.com',
    measurementId: 'G-6BE43RG4Z6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnzsx-S8DznApsMujtPM9mNkqksbiBfxE',
    appId: '1:628743886259:android:1d6d9ddee92926826227c6',
    messagingSenderId: '628743886259',
    projectId: 'flutter-demo-2d6c3',
    storageBucket: 'flutter-demo-2d6c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD58inCn540qcO9Ny4wSTxU7LnN0QUBkTY',
    appId: '1:628743886259:ios:f67ec503def639b46227c6',
    messagingSenderId: '628743886259',
    projectId: 'flutter-demo-2d6c3',
    storageBucket: 'flutter-demo-2d6c3.appspot.com',
    iosBundleId: 'com.example.loginUiChallenge1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD58inCn540qcO9Ny4wSTxU7LnN0QUBkTY',
    appId: '1:628743886259:ios:f67ec503def639b46227c6',
    messagingSenderId: '628743886259',
    projectId: 'flutter-demo-2d6c3',
    storageBucket: 'flutter-demo-2d6c3.appspot.com',
    iosBundleId: 'com.example.loginUiChallenge1',
  );
}
