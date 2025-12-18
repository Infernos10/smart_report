import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'front_page.dart';

void main() async {
  // Make main an async function
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Add Firebase App Check activation here
  // For web, you typically use ReCaptchaV3Provider.
  // Replace 'recaptcha-v3-site-key' with your actual reCAPTCHA v3 site key.
  // For Android, you can choose from various providers. Debug provider is good for development.
  // In production, you'd typically use AndroidProvider.playIntegrity or AndroidProvider.safetyNet.
  // For iOS/macOS, you can use App Attest (recommended for iOS 14.0+) or Device Check.
  // Debug provider is suitable for development.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // The Firebase initialization is now handled directly in the main() function,
  // so we can simplify this.
  // We can remove the _init Future and _initializeFirebase method if Firebase is fully initialized in main.
  // For now, I'll keep the FutureBuilder structure but remove the redundant call if main() already initialized it.

  @override
  Widget build(BuildContext context) {
    // If Firebase.initializeApp() is already awaited in main(),
    // you might not need a FutureBuilder here specifically for Firebase initialization.
    // However, if there are other async operations your app needs to wait for before rendering,
    // FutureBuilder is still a good pattern.
    // For this example, assuming Firebase is initialized by main(), we can remove the FutureBuilder
    // around Firebase.initializeApp() and directly return MaterialApp.

    // If you prefer to keep the FutureBuilder to show a loading indicator
    // for other reasons, you would adjust the future being waited on.
    // For now, I'm providing the simplest modification.
    return MaterialApp(
      title: 'Smart Report',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FrontPage(),
    );
  }
}
