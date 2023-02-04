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
    apiKey: 'AIzaSyDHDBKwS8MqqdjKxrlyt30__6HD2n1SQzY',
    appId: '1:445840120931:web:b79055bcc7026e2951ac56',
    messagingSenderId: '445840120931',
    projectId: 'employee-leave-app',
    authDomain: 'employee-leave-app.firebaseapp.com',
    storageBucket: 'employee-leave-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ2Um20Nm6D9JRy4brm3F1Tnh9NqXX1sQ',
    appId: '1:445840120931:android:b1c55bb29250cc8c51ac56',
    messagingSenderId: '445840120931',
    projectId: 'employee-leave-app',
    storageBucket: 'employee-leave-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArUvHSkXU0Kz0Z1EsRPqW8GRJ3oTv7jZk',
    appId: '1:445840120931:ios:6e89386d1bbb4c9951ac56',
    messagingSenderId: '445840120931',
    projectId: 'employee-leave-app',
    storageBucket: 'employee-leave-app.appspot.com',
    iosClientId: '445840120931-3m4u1tlgicqe8ad7ov0ah65vkluciuqt.apps.googleusercontent.com',
    iosBundleId: 'com.example.tugasAkhirFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArUvHSkXU0Kz0Z1EsRPqW8GRJ3oTv7jZk',
    appId: '1:445840120931:ios:6e89386d1bbb4c9951ac56',
    messagingSenderId: '445840120931',
    projectId: 'employee-leave-app',
    storageBucket: 'employee-leave-app.appspot.com',
    iosClientId: '445840120931-3m4u1tlgicqe8ad7ov0ah65vkluciuqt.apps.googleusercontent.com',
    iosBundleId: 'com.example.tugasAkhirFlutter',
  );
}
