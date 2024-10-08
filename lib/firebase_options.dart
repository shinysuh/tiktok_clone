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
    apiKey: 'AIzaSyCDsKHGFGInuiGvozMAR9xLsUtkEbt4Srg',
    appId: '1:755329000239:web:befa478b5507c430e1f7da',
    messagingSenderId: '755329000239',
    projectId: 'tiktok-clone-jenn',
    authDomain: 'tiktok-clone-jenn.firebaseapp.com',
    storageBucket: 'tiktok-clone-jenn.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAPwXQuHrLDNRFJ2NbGyGEd4E0eoLMewwg',
    appId: '1:755329000239:android:0259f6bddd6724eae1f7da',
    messagingSenderId: '755329000239',
    projectId: 'tiktok-clone-jenn',
    storageBucket: 'tiktok-clone-jenn.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWCsMGXr5Eb8a4kj7txPCOfCa-Ydf31ks',
    appId: '1:755329000239:ios:f9ebb5598df1dc68e1f7da',
    messagingSenderId: '755329000239',
    projectId: 'tiktok-clone-jenn',
    storageBucket: 'tiktok-clone-jenn.appspot.com',
    androidClientId: '755329000239-pgg5gimthm2gl59hv6tebf747atjepdt.apps.googleusercontent.com',
    iosClientId: '755329000239-0991avs4v28bbvhgeb8e4krje32o3b3n.apps.googleusercontent.com',
    iosBundleId: 'com.example.tiktokClone',
  );

}