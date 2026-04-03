
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/recording_screen.dart';
import 'screens/review_screen.dart';
import 'screens/secured_screen.dart';
import 'screens/contracts_screen.dart';
import 'screens/history_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const SealApp(),
    ),
  );
}

class SealApp extends StatelessWidget {
  const SealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEAL App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003366),
          primary: const Color(0xFF003366),
          secondary: const Color(0xFF29C39B),
          background: const Color(0xFFF4F7FA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FA),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: child!,
          ),
        );
      },
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/record': (context) => const RecordingScreen(),
        '/review': (context) => const ReviewScreen(),
        '/secured': (context) => const SecuredScreen(),
        '/contracts': (context) => const ContractsScreen(),
        '/history': (context) => const HistoryScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
