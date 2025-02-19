

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
    apiKey: 'AIzaSyD9Byj5YNqFI3uFStxRcv9-rDsozdiSo3s',
    appId: '1:779156543984:web:e38aadbccb779dbcfb6535',
    messagingSenderId: '151818453094',
    projectId: 'cucs-2ab2d',
    authDomain: 'authtutorial-de80c.firebaseapp.com',
    storageBucket: 'cucs-2ab2d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9Byj5YNqFI3uFStxRcv9-rDsozdiSo3s',
    appId: '1:151818453094:android:3f374162ed752951192da7',
    messagingSenderId: '151818453094',
    projectId: 'cucs-2ab2d',
    storageBucket: 'cucs-2ab2d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9Byj5YNqFI3uFStxRcv9-rDsozdiSo3s',
    appId: '1:151818453094:android:3f374162ed752951192da7',
    messagingSenderId: '151818453094',
    projectId: 'cucs-2ab2d',
    storageBucket: 'cucs-2ab2d.appspot.com',
    iosClientId: '637905690799-9shnm980f8q6vjk9rbq6eih4tfp1l7jg.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );

}