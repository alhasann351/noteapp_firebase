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
    apiKey: 'AIzaSyBoCXkiD8q2WawgmxgfN7Pp52wVbJzqDAE',
    appId: '1:57789118013:web:6de43cbcc71f3a9fb01c54',
    messagingSenderId: '57789118013',
    projectId: 'notes-app-41321',
    authDomain: 'notes-app-41321.firebaseapp.com',
    storageBucket: 'notes-app-41321.appspot.com',
    measurementId: 'G-9L1727LBW8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1b2TSts50oCLOgjv2jJwmtyj6cm_QTiI',
    appId: '1:57789118013:android:b4eb756e4f8ce3dbb01c54',
    messagingSenderId: '57789118013',
    projectId: 'notes-app-41321',
    storageBucket: 'notes-app-41321.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBo1UURjvpejwz1pTncW_oM_FDxC_ZLt-o',
    appId: '1:57789118013:ios:01924dbeb5a422dbb01c54',
    messagingSenderId: '57789118013',
    projectId: 'notes-app-41321',
    storageBucket: 'notes-app-41321.appspot.com',
    iosBundleId: 'com.noteapp.firebase.noteappFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBo1UURjvpejwz1pTncW_oM_FDxC_ZLt-o',
    appId: '1:57789118013:ios:01924dbeb5a422dbb01c54',
    messagingSenderId: '57789118013',
    projectId: 'notes-app-41321',
    storageBucket: 'notes-app-41321.appspot.com',
    iosBundleId: 'com.noteapp.firebase.noteappFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBoCXkiD8q2WawgmxgfN7Pp52wVbJzqDAE',
    appId: '1:57789118013:web:aad9c02d364c65a2b01c54',
    messagingSenderId: '57789118013',
    projectId: 'notes-app-41321',
    authDomain: 'notes-app-41321.firebaseapp.com',
    storageBucket: 'notes-app-41321.appspot.com',
    measurementId: 'G-SSRDYMQV29',
  );
}
