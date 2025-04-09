import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Added for SystemUiOverlayStyle
// Assuming login page is here, adjust path as needed based on your structure
import 'app/presentation/pages/login_page.dart';
import 'app/presentation/pages/dashboard_page.dart';
import 'core/routes/transition_route_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme/app_theme.dart'; // Import our custom theme
import 'package:google_fonts/google_fonts.dart'; // For loading Google Fonts

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness:
          Brightness.light, // Light status bar icons for dark backgrounds
      systemNavigationBarColor: Color(0xFF00796B), // Match primary color
      systemNavigationBarIconBrightness:
          Brightness.light, // Light navigation bar icons
    ),
  );

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Google Fonts
  GoogleFonts.config.allowRuntimeFetching = false;

  // TODO: Add any necessary initializations here (e.g., service locators, environment setup)
  runApp(const KomunidadHealthLogApp());
}

class KomunidadHealthLogApp extends StatelessWidget {
  const KomunidadHealthLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komunidad Health Log',
      // Use our custom theme
      theme: AppTheme.getLightTheme(),
      // We could also support dark mode with: darkTheme: AppTheme.getDarkTheme(),
      navigatorObservers: [TransitionRouteObserver()],
      initialRoute: LoginPage.routeName, // If using named routes
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        DashboardPage.routeName:
            (context) => const DashboardPage(), // Placeholder
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
