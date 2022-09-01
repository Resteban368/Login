import 'package:firebase_core/firebase_core.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      initialRoute: 'login',
      routes: {
        //validaciones
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        //pantallas de la app
        'home': (_) => const HomeScreen(),
      },
      //no lo instancia en el constructor porque no se necesita, ya que es una propiedad de estatica
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
