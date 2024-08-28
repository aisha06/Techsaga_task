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
    apiKey: 'AIzaSyADnJ9WExaJ8e23ScDbdf5G7jpX_PpkvYQ',
    appId: '1:674611772787:web:3627beb8d2a0cc74eb5906',
    messagingSenderId: '674611772787',
    projectId: 'techsaga-afc67',
    authDomain: 'techsaga-afc67.firebaseapp.com',
    storageBucket: 'techsaga-afc67.appspot.com',
    measurementId: 'G-R5HMV4X1CG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlUMNEj0WLBx4GkSCNhEee1uiVv15dSbc',
    appId: '1:674611772787:android:8dce40ff0845107feb5906',
    messagingSenderId: '674611772787',
    projectId: 'techsaga-afc67',
    storageBucket: 'techsaga-afc67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9B6Oy-Ht4rcbgDTZY2AMoOfFX0F6QZsk',
    appId: '1:674611772787:ios:04fa001e6341345eeb5906',
    messagingSenderId: '674611772787',
    projectId: 'techsaga-afc67',
    storageBucket: 'techsaga-afc67.appspot.com',
    iosBundleId: 'com.example.taskk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9B6Oy-Ht4rcbgDTZY2AMoOfFX0F6QZsk',
    appId: '1:674611772787:ios:04fa001e6341345eeb5906',
    messagingSenderId: '674611772787',
    projectId: 'techsaga-afc67',
    storageBucket: 'techsaga-afc67.appspot.com',
    iosBundleId: 'com.example.taskk',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADnJ9WExaJ8e23ScDbdf5G7jpX_PpkvYQ',
    appId: '1:674611772787:web:e1c8ec8c085fdc1feb5906',
    messagingSenderId: '674611772787',
    projectId: 'techsaga-afc67',
    authDomain: 'techsaga-afc67.firebaseapp.com',
    storageBucket: 'techsaga-afc67.appspot.com',
    measurementId: 'G-RHXRM1V49Z',
  );
}