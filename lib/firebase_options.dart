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
    apiKey: 'AIzaSyC8twvSTTyIy2OsiMfMi8RlWv-wa5j5rYQ',
    appId: '1:391671647019:web:a7e75b0a1705f6b782936e',
    messagingSenderId: '391671647019',
    projectId: 'miyo-moneymanager',
    authDomain: 'miyo-moneymanager.firebaseapp.com',
    storageBucket: 'miyo-moneymanager.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdKN0EgoLsD9xM1LFxIAdYfuiD2-jgLmo',
    appId: '1:391671647019:android:72295d190e476dec82936e',
    messagingSenderId: '391671647019',
    projectId: 'miyo-moneymanager',
    storageBucket: 'miyo-moneymanager.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVZQDBjciYR_WVqHe0Cnx0j_-Uc7WCcqU',
    appId: '1:391671647019:ios:30f7c4c98f015e6b82936e',
    messagingSenderId: '391671647019',
    projectId: 'miyo-moneymanager',
    storageBucket: 'miyo-moneymanager.firebasestorage.app',
    iosBundleId: 'com.example.moneyManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVZQDBjciYR_WVqHe0Cnx0j_-Uc7WCcqU',
    appId: '1:391671647019:ios:30f7c4c98f015e6b82936e',
    messagingSenderId: '391671647019',
    projectId: 'miyo-moneymanager',
    storageBucket: 'miyo-moneymanager.firebasestorage.app',
    iosBundleId: 'com.example.moneyManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC8twvSTTyIy2OsiMfMi8RlWv-wa5j5rYQ',
    appId: '1:391671647019:web:08aec3a75c75fba882936e',
    messagingSenderId: '391671647019',
    projectId: 'miyo-moneymanager',
    authDomain: 'miyo-moneymanager.firebaseapp.com',
    storageBucket: 'miyo-moneymanager.firebasestorage.app',
  );
}
