import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAgfFjndnuWNVxFeoXKmm7aRdoY-gTiGgA",
            authDomain: "turistando-65cce.firebaseapp.com",
            projectId: "turistando-65cce",
            storageBucket: "turistando-65cce.appspot.com",
            messagingSenderId: "379528837689",
            appId: "1:379528837689:web:f1622a5b49544938c16be8",
            measurementId: "G-YS9GLXGBWK"));
  } else {
    await Firebase.initializeApp();
  }
}
