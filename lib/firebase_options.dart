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
    apiKey: 'AIzaSyCHdDicbVc19LkV-uxZYvTNSK-kr-GpeFw',
    appId: '1:449430551837:web:9cd4f928a24225272ef5f4',
    messagingSenderId: '449430551837',
    projectId: 'firstfirebase-b1066',
    authDomain: 'firstfirebase-b1066.firebaseapp.com',
    storageBucket: 'firstfirebase-b1066.appspot.com',
    measurementId: 'G-ST3F9RTRC3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzArXH2l6a4pCMHfZVM8KX0-i4-GMF2Po',
    appId: '1:449430551837:android:6e74b9aa0478a3be2ef5f4',
    messagingSenderId: '449430551837',
    projectId: 'firstfirebase-b1066',
    storageBucket: 'firstfirebase-b1066.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDk6di5eVEWoaDi231C5DSDHDKB4xa09gs',
    appId: '1:449430551837:ios:78e6ff99ad326ef82ef5f4',
    messagingSenderId: '449430551837',
    projectId: 'firstfirebase-b1066',
    storageBucket: 'firstfirebase-b1066.appspot.com',
    iosClientId: '449430551837-h57ins8edkq63j3uo7bpe3heq5j9mup9.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDk6di5eVEWoaDi231C5DSDHDKB4xa09gs',
    appId: '1:449430551837:ios:b2f2324137247f6d2ef5f4',
    messagingSenderId: '449430551837',
    projectId: 'firstfirebase-b1066',
    storageBucket: 'firstfirebase-b1066.appspot.com',
    iosClientId: '449430551837-5ipe1ktdqirvdc37518sssi8a7ngqgrj.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseproject.RunnerTests',
  );
}
