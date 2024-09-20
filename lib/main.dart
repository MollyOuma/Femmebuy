import 'package:firebase_core/firebase_core.dart'; // Firebase Core
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Loading animation
import 'package:femmebuy/onboarding.dart'; // Onboarding screen
import 'package:femmebuy/sign_up_screen.dart'; // Sign-up screen
import 'package:femmebuy/login_screen.dart'; // Login screen
import 'package:femmebuy/home_screen.dart'; // Home screen
import 'package:femmebuy/budget_screen.dart'; // Budget tracking screen
import 'package:femmebuy/category_selector.dart'; // Categories with icons
import 'package:femmebuy/sharing_service.dart'; // Social sharing service
import 'package:femmebuy/ai_service.dart'; // AI service for shopping suggestions
import 'package:femmebuy/firestore_service.dart'; // Firestore service for multi-device sync
import 'package:flutter/foundation.dart' show kIsWeb; // Check if running on the web
import 'package:femmebuy/review_screen.dart'; // Login screen
import 'package:femmebuy/ItemInput.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  
  // Initialize Firebase based on the platform (web or mobile)
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDfftmWOO_1fQIFRnr2TWMVTUHDLqXq-IU",
        authDomain: "femmebuy-6f133.firebaseapp.com",
        projectId: "femmebuy-6f133",
        storageBucket: "femmebuy-6f133.appspot.com",
        messagingSenderId: "205780907791",
        appId: "1:205780907791:web:13f0b1772263300023b07a",
        measurementId: "G-CRWSRP9HYV",
      ),
    );
  } else {
    await Firebase.initializeApp(); // Mobile initialization
  }

  runApp(FemmeBuyApp()); // Run the app
}

class FemmeBuyApp extends StatelessWidget {
  const FemmeBuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FemmeBuy',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash', // Set initial route to SplashScreen
      routes: {
        '/splash': (context) => SplashScreen(), // Route to SplashScreen
        '/onboarding': (context) => OnboardingScreen(), // Route to OnboardingScreen
        '/login': (context) => LoginScreen(), // Route to LoginScreen
        // '/signUp': (context) => SignUpScreen(), // Route to SignUpScreen
        '/home': (context) => HomeScreen(), // Route to HomeScreen
        '/budget': (context) => BudgetScreen(items: const []), // Route to BudgetScreen (example with empty list)
        '/categories': (context) => CategorySelector(onItemAdded: (String category, String item) {  }, onMarkAsBought: (String item) {  }, onCategorySelected: (String category) {  },), // Route to CategorySelector
        // Add other routes as needed
        'items': (contxt) => ReviewScreen(categorizedItems: {},),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3), () {}); // Wait for 3 seconds
    Navigator.pushReplacementNamed(context, '/onboarding'); // Navigate to OnboardingScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 150), // Add your logo here
            const SizedBox(height: 20),
            const SpinKitChasingDots(
              color: Colors.white,
              size: 50.0,
            ), // Cool loading animation
          ],
        ),
      ),
    );
  }
}
