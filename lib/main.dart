import 'package:flutter/material.dart';

//Packages
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

//Services
import './services/navigation_service.dart';

//Providers
import './providers/authentication_provider.dart';

//Pages
import './pages/splash_page.dart';
import './pages/login_page.dart';
import './pages/register_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          const MainApp(),
        );
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Chatapp',
        theme: ThemeData(
          backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => const LoginPage(),
          '/register': (BuildContext _context) => const RegisterPage(),
          '/home': (BuildContext _context) => const HomePage(),
        },
      ),
    );
  }
}
