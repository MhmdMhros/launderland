// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDb0zpFb0dDd_rTXGw_5wkrdyu4Pqs1-Ng',
    appId: '1:809490721079:ios:9caf09084bb4eaa24692b2',
    messagingSenderId: '809490721079',
    projectId: 'launderlandapp-7dc4f',
    databaseURL: 'https://launderlandapp-7dc4f-default-rtdb.firebaseio.com',
    storageBucket: 'launderlandapp-7dc4f.appspot.com',
    androidClientId: '809490721079-2kverl6jcverkl964j5f3quqab6ksd3v.apps.googleusercontent.com',
    iosClientId: '809490721079-28rfoqua51b78a8hnjskmjv87jvmjf5b.apps.googleusercontent.com',
    iosBundleId: 'com.kenrys.launderland',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOftXGNnY2m5Ky67laftahhoor71ayPqw',
    appId: '1:809490721079:android:91438523e77ffa2d4692b2',
    messagingSenderId: '809490721079',
    projectId: 'launderlandapp-7dc4f',
    databaseURL: 'https://launderlandapp-7dc4f-default-rtdb.firebaseio.com',
    storageBucket: 'launderlandapp-7dc4f.appspot.com',
  );

}