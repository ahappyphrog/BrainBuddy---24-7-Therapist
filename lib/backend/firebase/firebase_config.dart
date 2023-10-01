import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBaynVJlVuKa2T9blInphkFPiX-4yPYCWE",
            authDomain: "fir-test-d139c.firebaseapp.com",
            projectId: "fir-test-d139c",
            storageBucket: "fir-test-d139c.appspot.com",
            messagingSenderId: "393008488955",
            appId: "1:393008488955:web:f14d1e7286739cf20e2b5e"));
  } else {
    await Firebase.initializeApp();
  }
}
