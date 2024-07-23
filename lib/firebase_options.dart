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
    apiKey: 'AIzaSyCKsIewKye3pHqsR96pdUUj07QLF-nO0gg',
    appId: '1:39313878954:web:c2865346b51c80b4a645d3',
    messagingSenderId: '39313878954',
    projectId: 'chatapp-c70fa',
    authDomain: 'chatapp-c70fa.firebaseapp.com',
    storageBucket: 'chatapp-c70fa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF5VZAkfIFW4FE5N1EsQEBRE7vCmadaIg',
    appId: '1:627387906160:android:3daf2f1de7da0e5680dcb5',
    messagingSenderId: '627387906160',
    projectId: 'chat-app-1fd72',
    storageBucket: 'chat-app-1fd72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNEF-teOe2xqHM0PSjvh3MnXlnVOpgywY',
    appId: '1:627387906160:ios:56de36f1cf43801580dcb5',
    messagingSenderId: '627387906160',
    projectId: 'chat-app-1fd72',
    storageBucket: 'chat-app-1fd72.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJ4Hv-sxzlpJAhpwU0N_3iZrPoMEiPs4Q',
    appId: '1:39313878954:ios:8a13beba1086329aa645d3',
    messagingSenderId: '39313878954',
    projectId: 'chatapp-c70fa',
    storageBucket: 'chatapp-c70fa.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKsIewKye3pHqsR96pdUUj07QLF-nO0gg',
    appId: '1:39313878954:web:afb369f0a9d11e7fa645d3',
    messagingSenderId: '39313878954',
    projectId: 'chatapp-c70fa',
    authDomain: 'chatapp-c70fa.firebaseapp.com',
    storageBucket: 'chatapp-c70fa.appspot.com',
  );
}