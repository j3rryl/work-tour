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
    apiKey: 'AIzaSyAwLq7ngdhOi-e89oezcxwLmlK9wkE_xo0',
    appId: '1:678279418514:web:c6e8475525f0569b860c4b',
    messagingSenderId: '678279418514',
    projectId: 'work-tour',
    authDomain: 'work-tour.firebaseapp.com',
    storageBucket: 'work-tour.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqW7el0FKpVEBJpvTS3NQI6C1FbimKelM',
    appId: '1:678279418514:android:e278c39293032a9e860c4b',
    messagingSenderId: '678279418514',
    projectId: 'work-tour',
    storageBucket: 'work-tour.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhXyttGxsMQ52lXqdxOuK470slXJAQ7fY',
    appId: '1:678279418514:ios:0562c16398640a9c860c4b',
    messagingSenderId: '678279418514',
    projectId: 'work-tour',
    storageBucket: 'work-tour.appspot.com',
    iosClientId: '678279418514-ndlae00mb87c537lksjvh8trdsj6g9o1.apps.googleusercontent.com',
    iosBundleId: 'com.example.smWork',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhXyttGxsMQ52lXqdxOuK470slXJAQ7fY',
    appId: '1:678279418514:ios:0562c16398640a9c860c4b',
    messagingSenderId: '678279418514',
    projectId: 'work-tour',
    storageBucket: 'work-tour.appspot.com',
    iosClientId: '678279418514-ndlae00mb87c537lksjvh8trdsj6g9o1.apps.googleusercontent.com',
    iosBundleId: 'com.example.smWork',
  );
}